SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PointOfInterest](
	 [ID]              [int] IDENTITY(123456789,3) NOT NULL
	,[PointID]         [int]               NOT NULL
	,[PointTitle]      [varchar](100)          NULL
	,[PointInterest]   [text]                  NULL
	,CreatedDateTime   [datetime]          NOT NULL
	,EditedDateTime    [datetime]          NOT NULL
	,CreatedBy         [varchar](50)       NOT NULL
	,EditedBy          [varchar](50)       NOT NULL
	,[meta01]          [varchar](50)           NULL /* color perhaps? */
	,[meta02]          [varchar](50)           NULL

	,CONSTRAINT PK_PointOfInterest PRIMARY KEY CLUSTERED    (ID)
	,INDEX      IX_PointID                     NONCLUSTERED (PointID)
	,INDEX      IX_Created                     NONCLUSTERED (CreatedDateTime)
	,INDEX      IX_Edited                      NONCLUSTERED (EditedDateTime)
) 
GO
	
-- Typically the SQL to populate the table would not be public source - for this example it's fine..
DECLARE @CreateTimeStamp DateTime = GetDate() -- or some other value
DECLARE @CreateUser varchar(50) = 'CHR'

INSERT INTO PointOfInterest(CreatedDateTime, EditedDateTime, CreatedBy, EditedBy, PointID, PointTitle,PointInterest,Meta01)

          SELECT /* 1,*/@CreateTimeStamp,@CreateTimeStamp,@CreateUser,@CreateUser, 1,'My Roots Go Down!','PHA+SmFjayBwaW5lIGlzIHRoZSBtb3N0IGNvbW1vbiB0eXBlIG9mIHRyZWUgdGhhdCB5b3Ugd2lsbCBlbmNvdW50ZXIgb24gdGhpcyB0cmFpbC4gUHJvYmUgdGhlIGdyb3VuZCB3aXRoIHlvdXIgZmluZ2VycyBhbmQgZmVlbCB0aGUgc2FuZHkgc29pbCBiZW5lYXRoIHRoZSBzaGFsbG93IGxheWVyIG9mIGR1ZmYuIFRoZXNlIHNvaWxzIGFyZSBwb29ybHkgZGV2ZWxvcGVkIGFuZCBzdWJqZWN0IHRvIHdhdGVyIGFuZCB3aW5kIGVyb3Npb24uVGhlIGRlZXAgdGFwIHJvb3RzIG9mIHRoZXNlIHRyZWVzIG11c3QgcmVhY2ggZG93biB0byBjYXB0dXJlIG51dHJpZW50cywgYXMgd2VsbCBhcyB0byBwcm92aWRlIHN0YWJpbGl0eS48L3A+IDxwPlRvdWNoIHRoZSJ0d2VlemVyLWxpa2UidHdpbm5lZCBuZWVkbGVzIG9mIHRoZSBwaW5lLiBGZWVsIHRoZSB0aGljayBiYXJrIHRoYXQgcHJvdGVjdHMgdGhlc2UgdHJlZXMgZnJvbSBncm91bmQgZmlyZXMuIEZpbmQgYSBwaW5lIGNvbmUgYW5kIG5vdGljZSB0aGUgdG91Z2ggcmVzaW4gdGhhdCBob2xkcyB0aGUgc2NhbGVzIGNsb3NlZC4gT25seSBoZWF0IC0gb3IgYSBzcXVpcnJlbFwncyB0ZWV0aCAtIHdpbGwgcmVsZWFzZSB0aGUgc2VlZHMgd2l0aGluLiBJbiBmYWN0LCA8aW1nIHNyYz0iaW1nL2lsbHVzdHJhdGlvbjEucG5nIiBjbGFzcz0iaWxsdXN0cmF0aW9uNDQiIHN0eWxlPSJmbG9hdDogcmlnaHQ7IHBhZGRpbmc6IDJweDsiPiBpdCB3YXMgYSBwcmV2aW91cyBmaXJlIHRoYXQgZ2F2ZSBiaXJ0aCB0byB0aGlzIGZvcmVzdC48L3A+IDxwPkdsYW5jZSB1cCBhdCB0aGUgdGFuZ2xlZCBuZXN0IG9mIHNtYWxsIGJyYW5jaGVzIC0gYXB0bHkgbmFtZWQgIndpdGNoZXMgYnJvb20iIC0gYSByZWFjdGlvbiBjYXVzZWQgYnkgYSB0aW55IHBhcmFzaXRpYyBwbGFudCwgZHdhcmYgbWlzdGxldG9lLCB3aGljaCBoYXMgaW5mZWN0ZWQgdGhlc2UgdHJlZXMuIER3YXJmIG1pc3RsZXRvZSBjYXRhcHVsdHMgaXRzIHN0aWNreSBzZWVkcyBhcyBmYXIgYXMgMjAgbWV0ZXJzIG9udG8gdGhlIGJyYW5jaGVzIG9mIGFkamFjZW50IHRyZWVzLiBJbmZlY3RlZCB0cmVlcyB3ZWFrZW4gb3ZlciB0aW1lIGFuZCBtYXkgZXZlbnR1YWxseSBkaWUuPC9wPiA8cD5BcyB5b3UgY29udGludWUgdG8gZm9sbG93IHRoZSB0cmFpbCwgbGlzdGVuIGZvciB0aGUgY2hhdHRlciBvZiByZWQgc3F1aXJyZWxzIGFuZCBsb29rIGZvciBwYXRjaGVzIG9mIGRyeSBncm91bmQgY3JhbmJlcnJ5IGFuZCBiZWFyYmVycnkgb24gdGhlIGZvcmVzdCBmbG9vci4gQSAid2FsbCBvZiBzcHJ1Y2UiIHdpbGwgc2lnbmFsIHlvdXIgYXJyaXZhbCBhdCB0aGUgbmV4dCBzdG9wLjwvcD4=','white'
UNION ALL SELECT /* 2,*/@CreateTimeStamp,@CreateTimeStamp,@CreateUser,@CreateUser, 2,'I Feel a change coming on!','PHA+Q29tcGFyZSB0aGUgZm9yZXN0IGJlaGluZCB5b3Ugd2l0aCB0aGF0IGFoZWFkLiBBdCB5b3VyIGJhY2ssIHRoZSBqYWNrIHBpbmUgZW5kcyBhbmQgYmV5b25kIGxpZXMgYSBkYXJrIGdyZWVuIGhvcml6b24gb2YgYmxhY2sgc3BydWNlLjwvcD4gPHA+IE5vdGUgdGhlIG1vcmUgb3BlbiBzdGFuZCBvZiBqYWNrIHBpbmUuIEluIGNvbnRyYXN0LCB0aGUgc3BydWNlIGZvcmVzdCBncm93cyB0aWdodGx5IHRvZ2V0aGVyIHdpdGggYnJhbmNoZXMgaW50ZXJ0d2luZWQuIFRoZXJlIGlzIGx1c2ggdmVnZXRhdGlvbiBiZW5lYXRoIHRoZSBkcm9vcGluZyBzcHJ1Y2UgYm91Z2hzIGNvbXBhcmVkIHdpdGggdGhlIGFsbW9zdCBiYXJlIGdyb3VuZCB1bmRlciB0aGUgcGluZXMuIDxpbWcgc3JjPSJpbWcvaWxsdXN0cmF0aW9uMi5wbmciIGNsYXNzPSJpbGx1c3RyYXRpb240NCIgc3R5bGU9ImZsb2F0OiByaWdodDsgcGFkZGluZzogMnB4OyI+PC9wPiA8cD4gSW1hZ2luZSB5b3Vyc2VsZiBhbiB1bmRlcnN0b3J5IHBsYW50LiBXaGVyZSB3b3VsZCB5b3UgZ2V0IG1vcmUgc3VuPyBXaGVyZSB3b3VsZCB5b3UgZmluZCBtb3JlIHNoYWRlPyBXaGVyZSB3b3VsZCBpdCBiZSBkcmllcj8gV2V0dGVyPyBUaGUgdmFyaWV0eSBvZiBzcGFjZXMgcHJvdmlkZSBmb3IgYSBkaXZlcnNpdHkgb2Ygc3BlY2llcy48L3A+IDxwPiBZb3UgYXJlIGFib3V0IHRvIGVudGVyIGEgImNvbmlmZXIgc3dhbXAiLiBDb21lIGFuZCBleHBsb3JlIGEgd29ybGQgd2hlcmUgc3RheWluZyB3ZXQgaXMgYSB3YXkgb2YgbGlmZSE8L3A+','greenyellow'
UNION ALL SELECT /* 3,*/@CreateTimeStamp,@CreateTimeStamp,@CreateUser,@CreateUser, 3,'LIVING ON A SPONGE','PHA+VG91Y2ggdGhlICJzb2FraW5nIG1hdGggcXVvdGUgb2Ygb3JnYW5pYyBzb2lsIHRoYXQgcmVhY2hlcyBkZWVwZXIgVGhlbiB0aGUgaGVpZ2h0IG9mIHRoZSBob3VzZS4gT3ZlciB0aGUgdGltZSwgdGhlIGFjY3VtdWxhdGlvbiBvZiBwYXJ0aWFsbHkgZGVjb21wb3NlZCB2ZWdldGF0aW9uIGluIHRoaXMgZm9ybWVyIHN0cmVhbWJlZCBoYXMgYmVjb21lIDxpbWcgc3JjPSJpbWcvaWxsdXN0cmF0aW9uMy5wbmciIGNsYXNzPSJpbGx1c3RyYXRpb240NCIgc3R5bGU9ImZsb2F0OiByaWdodDsgbWFyZ2luLXJpZ2h0OiAxOHB4OyBwYWRkaW5nOiAycHg7Ij4gc2F0dXJhdGVkIHBlYXQuIFRoZXNlIGJsYWNrIHNwcnVjZSB0cmVlcywgd2l0aCB0aGVpciBzcHJlYWRpbmcgInBhbmNha2Ugcm9vdHMiIG1haW50YWluIGEgcHJlY2FyaW91cyBzdGFiaWxpdHkgaW4gdGhlc2Ugc3Bvbmd5IHNvaWxzLjwvcD4gPHA+IFJ1biB5b3VyIGhhbmQgb3ZlciB0aGUgY2FycGV0IG9mIGZlYXRoZXIgbW9zc2VzLiBJbiBzcHJpbmcsIHN1bi1jb2xvcmVkIG1hcnNoIG1hcmlnb2xkcyBicmlnaHRlbiB0aGlzIGJhY2tkcm9wLiBMb29rIGZvciB0aGUgdGFsbCB3aGl0ZSBib2ctb3JjaGlkLiBZb3VyIGZpZWxkIGd1aWRlIHdpbGwgaGVscCB5b3UgdG8gaWRlbnRpZnkgdGhlIG90aGVyIHBsYW50cyBhbWlkc3QgaG9yc2V0YWlscywgZ3Jhc3NlcyBhbmQgc2VkZ2VzLjwvcD4gPHA+IExlYXZpbmcgdGhlIGJvYXJkd2FsaywgeW91IHdpbGwgYWdhaW4gYmUgZW5jaXJjbGVkIGJ5IHRoZSBmYW1pbGlhciBwaW5lcy4gTGlzdGVuIGNhcmVmdWxseSBmb3IgYSBmYWludCAidGFwcGluZyIgb2YgYSBmb3JhZ2luZyBkb3dueSBvciBoYWlyeSB3b29kcGVja2VyLjwvcD4gPHA+IFlvdXIgbmV4dCBzdG9wIHdpbGwgcmV2ZWFsIHRoaXMgdHJhaWwncyBuYW1lc2FrZSE8L3A+','yellow'
UNION ALL SELECT /* 4,*/@CreateTimeStamp,@CreateTimeStamp,@CreateUser,@CreateUser, 4,'WHAT''S IN A NAME','PHA+QXQgdGhlIHRvcCBvZiB0aGlzIHJpc2UsIGEgbmV3IHdvcmxkIG9wZW5zIGJlZm9yZSB5b3UuIEtyaXN0aSBMYWtlIGlzIGEgY29tcGxleCBvZiBzaGFsbG93IG9wZW4gYW5kIG1hcnNoIHRoYXQgc3VzdGFpbnMgYSB2YXJpZXR5IG9mIHdldGxhbmQgd2lsZGxpZmUgYW5kIHZlZ2V0YXRpb24uPC9wPiA8cD4gVGhlIG9mZmljaWFsIG5hbWUgb2YgdGhpcyB3YXRlciBib2R5IGlzIGFjdHVhbGx5IENvdWJlYXV4IExha2UgLSBhZnRlciBub3RlZCBuYXR1cmFsaXN0IEV1Z2VuZSBDb3ViZWF1eCB3aG8gaGFpbGVkIGZyb20gQmVsZ2l1bSBhbmQgc3BlbnQgc29tZSB0aW1lIGluIGNlbnRyYWwgU2Fza2F0Y2hld2FuIHRvd2FyZHMgdGhlIHR1cm4gb2YgdGhlIHByZXZpb3VzIGNlbnR1cnkuPC9wPiA8cD4gVGhlIER1Y2tzIFVubGltaXRlZCBDYW5hZGEgc2lnbnMgbG9jYXRlZCBoZXJlIHdpbGwgZXhwbGFpbiB0aGUgaW1wb3J0YW5jZSBvZiB3YXRlciBhbmQgd2V0bGFuZHMsIGxpa2UgS3Jpc3RpIExha2UuIFRoZSBuZXh0IHNlY3Rpb24gb2YgdGhlIHRyYWlsIHBhcmFsbGVscyB0aGUgbm9ydGhlcm4gc2hvcmVsaW5lIG9mIEtyaXN0aSBMYWtlLiBUYWtlIHRoZSB0aW1lIHRvIGxvb2sgYW5kIGxpc3RlbiBmb3IgYmlyZHMgYW5kIG90aGVyIGFuaW1hbHMgdGhhdCBjYWxsIHRoaXMgImZvcmVzdCBvYXNpcyIgaG9tZS48L3A+IDxpbWcgc3JjPSJpbWcvaWxsdXN0cmF0aW9uNC5wbmciIGNsYXNzPSJpbGx1c3RyYXRpb24xMDAiIHN0eWxlPSJwYWRkaW5nOiAycHg7Ij4g','rgb(2 2 145)'
UNION ALL SELECT /* 5,*/@CreateTimeStamp,@CreateTimeStamp,@CreateUser,@CreateUser, 5,'THERE''S MORE TO WETLANDS THAN WATER','PHA+RWFybHkgaW4gc3ByaW5nLCBsaXN0ZW4gZm9yIHRoZSBjaG9ydXMgb2YgIkZyb2cgY291cnRzaGlwIi4gTGF0ZXIgaW4gdGhlIHNwcmluZywgd2F0Y2ggYXMgdGhlIG5leHQgZ2VuZXJhdGlvbiBvZiBDYW5hZGEgZ2Vlc2UgbGVhdmVzIHRoZSBuZXN0LiBCaXJkc29uZ3MgZmlsbCB0aGUgY3Jpc3AgbW9ybmluZyBhaXIsIGNsb3VkcyBvZiBhZHVsdCA8aW1nIHNyYz0iaW1nL2lsbHVzdHJhdGlvbjUucG5nIiBjbGFzcz0iaWxsdXN0cmF0aW9uNDQiIHN0eWxlPSJmbG9hdDogcmlnaHQ7IG1hcmdpbi1yaWdodDogMThweDsgcGFkZGluZzogMnB4OyI+IGNhZGRpc2ZsaWVzIGVtZXJnZSBmcm9tIHRoZWlyIGFxdWF0aWMgbnVyc2VyeSwgYSBtdXNrcmF0IHNsaWNlcyAgdGhyb3VnaCB0aGUgd2F0ZXIuLi4gdGhlcmUgaXMgYWx3YXlzIHNvbWV0aGluZyBuZXcuPC9wPiA8cD4gVGhlIHN0cmlwIG9mIGxhbmQgYmV0d2VlbiB5b3VyIGZlZXQgYW5kIHRoZSB3YXRlcidzIGVkZ2UgaXMgdGhlIHJpcGFyaWFuIGFyZWEgLSBhIHZpdGFsIGxpbmsgYmV0d2VlbiB3YXRlciBhbmQgbGFuZC4gUmlwYXJpYW4gem9uZXMgcmVkdWNlIGVyb3Npb24sIGZ1bm5lbCBudXRyaWVudHMgdG8gYXF1YXRpYyBlY29zeXN0ZW1zLCBhbmQgcHJvdmlkZSB3aWxkbGlmZSBoYWJpdGF0IGFuZCB0cmF2ZWwgY29ycmlkb3JzLiBDYW4geW91IHNlZSBhbnkgYW5pbWFsIHRyYWNrcyBsZWFkaW5nIHRvIGFuZCBmcm9tIHRoZSBsYWtlPzwvcD4gPHA+IE5vdGljZSB0aGUgYXJyYW5nZW1lbnQgb2YgdGhlIHZlZ2V0YXRpb24gc3Vycm91bmRpbmcgdGhlIG9wZW4gd2F0ZXIuIENhdHRhaWxzIGFuZCBydXNoZXMgb2NjdXB5IHRoZSB3ZXR0ZXN0IHBsYWNlczsgbmV4dCB0byB0aGVtIHdpbGxvd3MgYW5kIGFsZGVycywgYW5kIHNvbWUgdGFtYXJhY2suIFRoZW4gd2hlcmUgaXQgaXMgZHJpZXIsIHRoZSB0cmVtYmxpbmcgYXNwZW4gYW5kIHdoaXRlIHNwcnVjZSBhcHBlYXIuPC9wPiA8cD4gQXQgdGhlIG5leHQgc3RvcCB5b3Ugd2lsbCBlbmNvdW50ZXIgb25lIG9mIG5hdHVyZSdzIGVuaWdtYXMgLSBhbiBvcmdhbmlzbSB0aGF0IGlzIGEgcmVsYXRpb25zaGlwLjwvcD4=','rgb(230, 84, 84)'
UNION ALL SELECT /* 6,*/@CreateTimeStamp,@CreateTimeStamp,@CreateUser,@CreateUser, 6,'LIVING ON AIR','PHA+TW9zdCBvZiB0aGUgZ3JheWlzaC1ncmVlbiBjbHVtcHMgb2YgcGxhbnQtbGlrZSBtYXRlcmlhbCB0aGF0IHlvdSBzZWUgYXQgeW91ciBmZWV0IG9yIHRoZSAic3RyaW5neSBzdHVmZiIgaGFuZ2luZyBmcm9tIHRoZSB0cmVlIHRydW5rcyBhbmQgYnJhbmNoZXMgbGl2ZXMgb24gYWlyLjwvcD4gPHA+IExpY2hlbnMgYXJlIGNvbXBsZXggcmVsYXRpb25zaGlwcyBiZXR3ZWVuIGZ1bmdpIGFuZCBhbGdhZS4gQWxnYWUgcHJvZHVjZXMgY2FyYm9oeWRyYXRlcyB0aHJvdWdoIHBob3Rvc3ludGhlc2lzLCB3aGlsZSBmdW5naSBwcm92aWRlIHByb3RlY3Rpb24gYW5kIG9idGFpbnMgbW9pc3R1cmUgYW5kIG51dHJpZW50cyBmcm9tIHRoZSBhaXIuPC9wPiA8cD4gVGhlc2UgdHdvIHNwZWNpZXMgb2YgPGltZyBzcmM9ImltZy9pbGx1c3RyYXRpb242LnBuZyIgY2xhc3M9ImlsbHVzdHJhdGlvbjQ0IiBzdHlsZT0iZmxvYXQ6IHJpZ2h0OyBtYXJnaW4tcmlnaHQ6IDE4cHg7IHBhZGRpbmc6IDJweDsiPiBsaWNoZW5zIGFyZSBzb21lIG9mIHRoZSBvdmVyIDUwMCBzcGVjaWVzIG9mIGxpY2hlbnMgdGhhdCBvY2N1ciBpbiB0aGUgYm9yZWFsIGZvcmVzdC4gR3JlZW4gcmVpbmRlZXIgbGljaGVuIChDbGFkaW5hIG1pdGlzKSBhbmQgdGhlIE5vcnRoZXJuIHJlaW5kZWVyIGxpY2hlbiAoQ2xhZGluYSBzdGVsbGFyaXMpIGZvcm0gbXVjaCBvZiB0aGUgZ3JvdW5kIGNvdmVyLjwvcD4gPHA+IEdlbnRseSB0b3VjaCBzb21lIG9mIHRoZSBsaWNoZW5zIGF0IHlvdXIgZmVldC4gVGhleSBtYXkgZmVlbCBlaXRoZXIgYnJpdHRsZSwgaWYgdGhlIHdlYXRoZXIgaGFzIGJlZW4gZHJ5LCBvciBzcHJpbmd5LCBpZiB0aGVyZSBoYXMgYmVlbiByZWNlbnQgcHJlY2lwaXRhdGlvbi4gTGljaGVucyBhY3QgYXMgc3BvbmdlcywgdGFraW5nIHVwIGV2ZXJ5dGhpbmcgdGhhdCBjb21lcyB0aGVpciB3YXksIGluY2x1ZGluZyBhaXIgcG9sbHV0aW9uLiBGb3IgdGhpcyByZWFzb24sIGxpY2hlbnMgc2VydmUgYXMgaW5kaWNhdG9ycyBvZiBhaXIgcXVhbGl0eS48L3A+IDxwPiBBcyB5b3UgY29udGludWUgeW91ciB3YWxrLCB0YWtlIG5vdGUgb2YgdGhlIHZhcmlldHkgb2YgbGljaGVucyB0aGF0IHlvdSBlbmNvdW50ZXIgLSBvbiB0aGUgZ3JvdW5kLCBvbiB0cmVlcyBhbmQgb24gbG9ncy48L3A+IDxwPiBBdCB5b3VyIG5leHQgc3RvcCB5b3Ugd2lsbCBmaW5kIGEga2V0dGxlIC0gYnV0IGRvbid0IGV4cGVjdCBob3Qgd2F0ZXIgZm9yIHRlYSE8L3A+','skyblue'
UNION ALL SELECT /* 7,*/@CreateTimeStamp,@CreateTimeStamp,@CreateUser,@CreateUser, 7,'KETTLES GALORE, BUT WHERE IS THE WATER','PHA+VGhlIGhvbGxvdyBqdXN0IGluIGZyb250IG9mIHlvdSBpcyBjYWxsZWQgYSAia2V0dGxlIi4gTG9vayBhcm91bmQsIGFuZCB5b3Ugd2lsbCBub3RpY2Ugc2ltaWxhciBmZWF0dXJlcyBpbiB0aGUgYXJlYS48L3A+IDxwPiBPdmVyIDEwLDAwMCB5ZWFycyBhZ28sIGFzIHRoZSBnbGFjaWVycyBzbG93bHkgbWVsdGVkLCBsYXJnZSBjaHVua3Mgb2YgaWNlIGJyb2tlIG9mZiBhbmQgZ3JhZHVhbGx5IGJlY2FtZSBjb3ZlcmVkIGJ5IGdsYWNpYWwgdGlsbCByZWxlYXNlZCBmcm9tIHRoZSBtZWx0aW5nIGljZS4gV2l0aCB3YXJtaW5nIHRlbXBlcmF0dXJlcywgdGhlc2UgZ2lhbnQgaWNlIGN1YmVzIGV2ZW50dWFsbHkgbWVsdGVkIGFuZCB0aGUgbWF0ZXJpYWwgY292ZXJpbmcgdGhlbSBzYW5rIC0gbGVhdmluZyBkZXByZXNzaW9ucyBpbiB0aGUgbGFuZHNjYXBlIC0gbGlrZSB0aGUgb25lIHlvdSBzZWUgYmVmb3JlIHlvdS48L3A+IDxwPiBZb3Ugd29uJ3QgZmluZCBhbnkgd2F0ZXIgaW4gdGhpcyBrZXR0bGUuVGhlIHNvaWxzIHRoYXQgaGF2ZSBkZXZlbG9wZWQgaGVyZSA8aW1nIHNyYz0iaW1nL2lsbHVzdHJhdGlvbjcucG5nIiBjbGFzcz0iaWxsdXN0cmF0aW9uNDQiIHN0eWxlPSJmbG9hdDogcmlnaHQ7IG1hcmdpbi1yaWdodDogMThweDsgcGFkZGluZzogMnB4OyI+IGFyZSB3ZWxsLWRyYWluZWQgYW5kIHN1cHBvcnQgYSBmb3Jlc3QgY29tbXVuaXR5LiBIb3dldmVyLCB0aGUgbmV4dCB0aW1lIHlvdSB0YWtlIGEgZHJpdmUgaW4gdGhlIGNvdW50cnlzaWRlLCBvYnNlcnZlIHRoZSBjaXJjdWxhciBzaGFwZSBvZiBtYW55IG9mIG91ciBwb25kcyBhbmQgc2xvdWdocy4gTW9zdCBvZiB0aGVzZSBvcmlnaW5hdGVkIGFzIGdsYWNpYWwga2V0dGxlcy48L3A+IDxwPiBUYWtlIGEgY2xvc2VyIGxvb2sgYW5kIG5vdGljZSBob3cgdGhlIHBsYW50IGNvbW11bml0aWVzIGRpZmZlciwgZGVwZW5kaW5nIG9uIHdoaWNoIHNpZGUgb2YgdGhlIGtldHRsZSB0aGV5IGFyZSBncm93aW5nIG9uLiBXaGljaCBzbG9wZXMgZ2V0IG1vcmUgc3VuPyBXaGljaCBnZXQgbW9yZSBzaGFkZT88L3A+IDxwPiBKdXN0IGEgc2hvcnQgZGlzdGFuY2UgYWhlYWQgaXMgYW5vdGhlciBzdG9wIC0gb25lIHRoYXQgd2lsbCBjaGFsbGVuZ2UgeW91ciBhYmlsaXR5IHRvIGZvY3VzIG9uIHNtYWxsIGRldGFpbHMuPC9wPg==','black'
UNION ALL SELECT /* 8,*/@CreateTimeStamp,@CreateTimeStamp,@CreateUser,@CreateUser, 8,'MICRO HABITAT','PHA+VGFrZSB0aGUgJ09uZSBTdGVwIENoYWxsZW5nZScuIFN0YXlpbmcgb24gdGhlIHRyYWlsLCB0YWtlIG9uZSBHSUFOVCBzdGVwIGZvcndhcmQgYW5kIG1ha2UgYSBub3RlIG9mIHRoZSBkaXN0YW5jZSBiZXR3ZWVuIHlvdXIgbGVmdCBhbmQgcmlnaHQgZm9vdHN0ZXBzLiBOb3csIGV4YW1pbmUgdGhlIHN1cmZhY2Ugb24gZWl0aGVyIHNpZGUgb2YgdGhlIHRyYWlsIGFsb25nIHRoaXMgZGlzdGFuY2UuIFNlZSBpZiB5b3UgY2FuIGNvdW50IGF0IGxlYXN0IDEwIGRpZmZlcmVudCBraW5kcyBvZiBwbGFudHMuIFlvdSBtaWdodCBoYXZlIHRvIGdldCBkb3duIG9uIHlvdXIga25lZXMgYW5kIHBva2UgeW91ciBub3NlIHRocm91Z2ggdGhlIGdyZWVuZXJ5LiBTdXJwcmlzaW5nIGhvdyBtdWNoIHZhcmlldHkgeW91IGNhbiB1bmNvdmVyIDxpbWcgc3JjPSJpbWcvaWxsdXN0cmF0aW9uOC5wbmciIGNsYXNzPSJpbGx1c3RyYXRpb240NCIgc3R5bGU9ImZsb2F0OiByaWdodDsgbWFyZ2luLXJpZ2h0OiAxOHB4OyBwYWRkaW5nOiAycHg7Ij4gaW4gdGhlIHNwYWNlIG9mIGEgc2luZ2xlIGZvb3RzdGVwITwvcD4gPHA+IFlvdSBtaWdodCBldmVuIGZpbmQgYSBwYWxlIHBsYW50IG9mIG1lZGl1bSBoZWlnaHQsIGNvdmVyZWQgd2l0aCByZWQgb3IgcHVycGxpc2ggc3BvdHMuVGhpcyBpcyB0aGUgc3BvdHRlZCBjb3JhbHJvb3QgLSBhbiBvcmNoaWQgc3BlY2llcy4gVGhpcyBwbGFudCBoYXMgbm8gY2hsb3JvcGh5bGwuIEl0IGlzIHNhcHJvcGh5dGljLCB3aGljaCBtZWFucyBpdCBvYnRhaW5zIGl0cyBudXRyaWVudHMgZnJvbSBkZWFkIG9yZ2FuaWMgbWF0dGVyIHRocm91Z2ggYSBjb29wZXJhdGl2ZSAtIG9yIHN5bWJpb3RpYyAtIHJlbGF0aW9uc2hpcCB3aXRoIGEgZnVuZ3VzLjwvcD4gPHA+IEFzIHlvdSBjb250aW51ZSwgbG9vayBmb3IgdGhlIGNoYXJhY3RlcmlzdGljIHdoaXRlIHRydW5rIG9mIHRoZSB0cmVtYmxpbmcgYXNwZW4gZW1lcmdpbmcgaW4gdGhlIGRpc3RhbmNlLiBBIG1peGVkd29vZCBmb3Jlc3Qgb2YgcG9wbGFycyBhbmQgc3BydWNlIGxpZXMgYWhlYWQuPC9wPg==','pink'
UNION ALL SELECT /* 9,*/@CreateTimeStamp,@CreateTimeStamp,@CreateUser,@CreateUser, 9,'MIXING IT UP','PHA+WW91IGFyZSBub3cgaW4gYSBmb3Jlc3QgZG9taW5hdGVkIGJ5IHRyZW1ibGluZyBhc3Blbiwgd2l0aCBzb21lIGJhbHNhbSBwb3BsYXIgYW5kIHdoaXRlIHNwcnVjZS48L3A+PHA+IFdoeSAnbWl4ZWR3b29kJz8gVGhlIGJvcmVhbCBmb3Jlc3QgaXMgY29tcHJpc2VkIG9mIGEgbWl4dHVyZSBvZiBoYXJkd29vZHMgKHRyZW1ibGluZyBhc3BlbiwgYmFsc2FtIHBvcGxhciwgd2hpdGUgYmlyY2gpIGFuZCBzb2Z0d29vZHMgKGJsYWNrIGFuZCB3aGl0ZSBzcHJ1Y2UsIGJhbHNhbSBmaXIsIHRhbWFyYWNrIGFuZCBqYWNrIHBpbmUpLiBXaGljaCB0cmVlcyBncm93IHdoZXJlIGlzIDxpbWcgc3JjPSJpbWcvaWxsdXN0cmF0aW9uOWIucG5nIiBjbGFzcz0iaWxsdXN0cmF0aW9uNDQiIHN0eWxlPSJmbG9hdDogcmlnaHQ7IG1hcmdpbi1yaWdodDogMThweDsgcGFkZGluZzogMnB4OyI+IGRldGVybWluZWQgYnkgZGlmZmVyZW5jZXMgaW4gc29pbCwgbW9pc3R1cmUgY29uZGl0aW9ucywgYW5kIHRoZSB0eXBlIGFuZCBmcmVxdWVuY3kgb2YgbmF0dXJhbCBhbmQgaHVtYW4tY2F1c2VkIGRpc3R1cmJhbmNlcyAoZmlyZSwgbG9nZ2luZywgaW5zZWN0IGluZmVzdGF0aW9ucywgZGlzZWFzZSkuIFRoZSBib3JlYWwgZm9yZXN0IGlzIGEgbW9zYWljIG9mIHZhcmlvdXMtc2l6ZWQgcGF0Y2hlcyBvZiBmb3Jlc3QgZGlmZmVyaW5nIGluIGFnZSBhbmQgY29tcG9zaXRpb24uPC9wPjxwPiBQb2tlIHlvdXIgZmluZ2VyIGludG8gdGhlIHNvaWwuIFlvdSBtYXkgbm90aWNlIHNvaWxzIGhlcmUgaGF2ZSBsZXNzIHNhbmQgYW5kIG1vcmUgY2xheSBhbmQgdGhlIGRlcHRoIG9mIHRoZSBmb3Jlc3QgbGl0dGVyIC0gZGVhZCBtYXRlcmlhbCAtIGlzIG11Y2ggZ3JlYXRlciB0aGFuIGluIHRoZSBqYWNrIHBpbmUgZm9yZXN0LiBEZWNvbXBvc2luZyBmb3Jlc3QgbGl0dGVyIGZlZWRzIGEgbW9yZSBsdXNoIHVuZGVyc3Rvcnkgb2Ygc2hydWJzIGFuZCBoZXJiYWNlb3VzIHBsYW50cy48L3A+PHA+IENvbXBhcmUgdGhlIHR3byBwb3BsYXIgc3BlY2llcy4gQ2FuIHlvdSBzZWUgdGhlIGRlZXAgZGFyayA8aW1nIHNyYz0iaW1nL2lsbHVzdHJhdGlvbjkucG5nIiBjbGFzcz0iaWxsdXN0cmF0aW9uNDQiIHN0eWxlPSJmbG9hdDogcmlnaHQ7IG1hcmdpbi1yaWdodDogMThweDsgcGFkZGluZzogMnB4OyI+IGZ1cnJvd3MgYWxvbmcgdGhlIHRydW5rIG9mIHRoZSBiYWxzYW0gcG9wbGFyPyBUaGUgdHJlbWJsaW5nIGFzcGVuIHdpdGggdGhlIGdyZWVuaXNoLXdoaXRlLCBzbW9vdGggdHJ1bmsgaXMgbG9jYXRlZCBoZXJlIGFzIHdlbGwuIENhbiB5b3Ugc2VlIGl0PyBUaGUgdHJ1bmsgb2YgdGhlIHRyZW1ibGluZyBhc3BlbiBoYXMgYSB3aGl0ZSBwb3dkZXIgdGhhdCB3aWxsIHJ1YiBvZmYgb24geW91ciBoYW5kOyBpdCBpcyBiZWxpZXZlZCBieSBzb21lIHRvIGFjdCBhcyBhIHN1bnNjcmVlbiBmb3IgdGhlIHRyZWUuPC9wPjxwPjwvcD48cD4gQXMgeW91IHdhbGsgdG8geW91ciBuZXh0IHN0b3AsIHdhdGNoIGZvciBzaWducyBvZiBhbmltYWwgYWN0aXZpdHkuPC9wPg==','white'
UNION ALL SELECT /*10,*/@CreateTimeStamp,@CreateTimeStamp,@CreateUser,@CreateUser, 10,'WILDLIFE HAVEN','PHA+VGhpcyBwYXJ0IG9mIHRoZSBmb3Jlc3QgaXMgaG9tZSB0byBtYW55IHdpbGRsaWZlIHNwZWNpZXMgbGlrZSB3aGl0ZS10YWlsZWQgZGVlciwgc25vd3Nob2UgaGFyZSwgYW5kIHJlZC1iYWNrZWQgdm9sZS48L3A+IDxwPiBUaGUgZGVuc2Ugc2hydWJzIHByb3ZpZGUgZm9vZCBvciBicm93c2UgZm9yIGRlZXIgaW4gdGhlIHdpbnRlci4gVGFrZSBhIGNsb3NlIGxvb2sgYXQgdGhlIGVuZHMgb2YgdHdpZ3MgYW5kIHNlZSBpZiB5b3UgY2FuIGZpbmQgT05FIHRoYXQgaGFzIDxpbWcgc3JjPSJpbWcvaWxsdXN0cmF0aW9uMTAucG5nIiBjbGFzcz0iaWxsdXN0cmF0aW9uNDQiIHN0eWxlPSJmbG9hdDogcmlnaHQ7IG1hcmdpbi1yaWdodDogMThweDsgcGFkZGluZzogMnB4OyI+IG5vdCBiZWVuIGNoZXdlZCBvbi4gTG9vayBmb3IgdGhlIHJlZGRpc2ggYmFyayBvZiB0aGUgcmVkLW9zaWVyIGRvZ3dvb2QsIHRoZWlyIHByZWZlcnJlZCBicm93c2UuPC9wPiA8cD4gVGhlIGJvcmVhbCBtaXhlZHdvb2QgZm9yZXN0IGlzIGFsc28gb25lIG9mIHRoZSByaWNoZXN0IGVudmlyb25tZW50cyBmb3IgYnJlZWRpbmcgc29uZ2JpcmRzIGluIE5vcnRoIEFtZXJpY2EuIE92ZXIgMjUwIGJpcmQgc3BlY2llcywgbW9zdCBvZiB0aGVtIG1pZ3JhbnRzLCBoYXZlIGJlZW4gcmVjb3JkZWQgaW4gdGhlIGJvcmVhbCBlY29zeXN0ZW1zLiBJdCBpcyB0aGUgYWJ1bmRhbmNlIG9mIHByb3RlaW4tcmljaCAnYnVncycgd2hpY2ggbWFrZXMgdGhpcyBmb3Jlc3Qgc28gYXR0cmFjdGl2ZSBmb3IgdGhlbS48L3A+IDxwPiBZb3VyIGZpbmFsIHN0b3AgaXMganVzdCBhaGVhZC48L3A+','goldenrod'
UNION ALL SELECT /*11,*/@CreateTimeStamp,@CreateTimeStamp,@CreateUser,@CreateUser, 11,'LOOKING BACK - LOOKING AHEAD','PHA+VGhlIGZhbWlsaWFyIHBpbmVzIG9uY2UgbW9yZSBzdXJyb3VuZCB5b3UuICBZb3UgaGF2ZSBqdXN0IGV4cGxvcmVkIGZvdXIgdW5pcXVlIGVjb3N5c3RlbXMuIENhbiB5b3UgcmVtZW1iZXIgYW5kIG5hbWUgdGhlbT88L3A+PHA+IE5hdHVyZSByZW1pbmRzIHVzIHRoYXQgd2UgdG9vIGFyZSBwYXJ0IG9mIHRoZSBjeWNsZSBvZiBsaWZlLiBDb25zaWRlciB0aGUgSW1wYWN0cyBvZiBvdXIgZGF5LXRvLWRheSBsaXZlcyBvbiB0aGUgbmF0dXJhbCBzeXN0ZW1zIHRoYXQgc3VzdGFpbiB1cy4gUGVyY2hlZCBvbiB0aGUgYnJpbmsgb2YgZ2xvYmFsIGNsaW1hdGUgY2hhbmdlLCB0aGUga2luZCBvZiBmdXR1cmUgZm9yIHVzLGFuZCBmb3IgYWxsIGxpZmUgb24gdGhpcyBwbGFuZXQsIGlzIHVuY2VydGFpbi4gTWFrZSBvbmUgcGVyc29uYWwgY29tbWl0bWVudCB0b2RheSB0byBsZXNzZW4geW91ciBpbXBhY3Qgb24gb3VyIG5hdHVyYWwgZW52aXJvbm1lbnQuPC9wPjxwPiBUaGUgU2Fza2F0Y2hld2FuIEZvcmVzdHJ5IEFzc29jaWF0aW9uIGhvcGVzIHRoYXQgeW91IGhhdmUgZW5qb3llZCB5b3VyIHdhbGsgb24gdGhpcyBuYXR1cmUgdHJhaWwuIFdlIGludml0ZSB5b3UgdG8gcmV0dXJuIEluIGEgZGlmZmVyZW50IHNlYXNvbiB3aXRoIGEgZ3JvdXAsIGJ5IHlvdXJzZWxmIG9yIHdpdGggc29tZW9uZSBzcGVjaWFsLjwvcD48cD4gSWYgeW91IGhhdmUgYW55IGNvbW1lbnRzIG9yIGNvbmNlcm5zIHJlZ2FyZGluZyB0aGlzIHRyYWlsLCBwbGVhc2UgY29udGFjdCB0aGUgU2Fza2F0Y2hld2FuIEZvcmVzdHJ5IEFzc29jaWF0aW9uLiBDb25zaWRlciBqb2luaW5nIG91ciBvcmdhbml6YXRpb24gYW5kIGJlY29taW5nIGludm9sdmVkIGluIG91ciBlZHVjYXRpb25hbCBhbmQgY29uc2VydmF0aW9uIGFjdGl2aXRpZXMu','rgb(168, 98, 168)'

SELECT  * FROM PointOfInterest -- just to visual verify it's there!
