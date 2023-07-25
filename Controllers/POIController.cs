using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Newtonsoft.Json;
using System.Web.Http.Cors;

namespace KristiLakeTrailPOI_api.Controllers
{
    // Best practices - CORS should not be configured as wildcards - this is a demo...
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class POIController : ApiController
    {
        private KristiDemoEntities theDbContext;
        POIController()
        {
            theDbContext = new KristiDemoEntities();
        }

        [Route("list")]
        [HttpGet]
        public IEnumerable<object> POIList()
        {
            return POIdataCreate().items;
        }

        [Route("POI/{id}")]
        [HttpGet]
        public Object POI(int id)
        {
            // default is 1st if not found
            var rezult = POIdataCreate(id).items.Find(z => z.id == id);
            if (rezult is null) { rezult = POIdataCreate(1).items[0]; }
            return rezult;
        }

        [Route("POI")]
        [HttpGet]
        public Object POI1()
        {
            // it's debatable if this route should even exist... coddling poor client choices?
            var rezult = POIdataCreate(1).items[0];
            return rezult;
        }

        // utility function when converting the data from static strings to database elements
        //[Route("DataDump")]
        //[HttpGet]
        //public string DataDump()
        //{
        //    string rezult = "The following strings are JSON objects (BASE64 encoded) for each POI (Point of Interest) \n Each is separated by an end of line \n\n";
        //    string SQLpart = "INSERT INTO SeomtTable(xyz)";
        //    foreach (var thisPOI in POIdataCreate().items)
        //    {
        //        rezult += Base64Encode(JsonConvert.SerializeObject(thisPOI)) + "\n";
        //        SQLpart += $"\nSELECT {thisPOI.id},'{thisPOI.title}','{Base64It(thisPOI.blurbhtml)}','{thisPOI.buttoncolor}'";
        //    }            
        //    return rezult + SQLpart;
        //}

        private class POI_DTO
        {
            public int id;
            public string title;
            public string blurbhtml;
            public int previd;
            public int nextid;
            public string buttoncolor;
        }
        private class POIs
        {
            public List<POI_DTO> items;
        }

        private POIs POIdataCreate()
        {
            return POIdataCreate(0);
        }
        private POIs POIdataCreate(int id)
        {
            POIs result = new POIs();
            result.items = new List<POI_DTO>();

            List<PointOfInterest> tempdata = (from x in theDbContext.PointOfInterests orderby x.ID ascending select x).ToList();
            // This (below) was just here to show off how it might be done in the older
            // pre Entity Framework days - and beside - EF is a little bit overkill
            //  for this usecase - but we're here to demonstrate SQL connectivity
            //  not fight for a cause.
            // AND.. I know that I'm using EF for the next project that 
            //  will have CRUD and authentication... :)
            //List<PointOfInterest> tempdata = KristiLakeTrailPOI_api.data.OldFashionedSQLquery.RetrieveList(); // (from x in theDbContext.PointOfInterests orderby x.ID ascending select x).ToList();

            foreach (PointOfInterest thisPoint in tempdata)
            {
                result.items.Add(ToDTO(thisPoint, tempdata.Count()));
            }

            return result;
        }

        // if I was feeling perky I'd make this part of the POI_DTO class
        // as a constructor
        private POI_DTO ToDTO(PointOfInterest givenPOI, int lineInTheSand)
        {
            POI_DTO rezult = new POI_DTO()
            {
                id = givenPOI.PointID,
                title = givenPOI.PointTitle,
                blurbhtml = HelpingTools.faultTolerantBase64Decode(givenPOI.PointInterest),
                nextid = calcNext(givenPOI.PointID, lineInTheSand), //this is a calculation that should REALLY happen in the presentation layer - just sayin'
                previd = calPrev(givenPOI.PointID, lineInTheSand),
                buttoncolor = givenPOI.meta01
            };
            return rezult;
        }

        private int calPrev(int givenPOI, int itemcnt)
        {
            int rezult = givenPOI - 1;
            if (rezult < 1) { rezult = itemcnt; }
            return rezult;
        }

        private int calcNext(int givenPOI, int itemcnt)
        {
            int rezult = givenPOI + 1;
            if (rezult > itemcnt) { rezult = 1; }
            return rezult;
        }
    }
}
