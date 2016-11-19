update swedb.users 
set password = '654321', jobtitle = 'Professor'
where userid = '00001';

update swedb.pages 
set json = 
'{
	"manifests": {
		"manifest": {
			"standardVersions": "ocdxManifest schema v.1",
			"id": "https: //datahub.io/dataset/teahouse-corpus",
			"creator": "Kristen Schuster",
			"dateCreated": "2016 - 20 - 04",
			"comment": "This is an example OCDX manifest created by Krsiten Schuster",
			"researchObject": {
				"title": "Teahouse Corpus (updated)",
				"abstract": "The Teahouse corpus is aset of questions asked at the Wikipedia Teahouse, a peer support forum for new Wikipedia editors.This corpus contains data from its first two years of operation.",
				"dates": {
					"date": {
						"date": "2012 - 02 - 27",
						"label": "start"
					}
				}
			},
			"privacyEthics": {
				"oversight": {
					"label": "No assertion"
				}
			},
			"informedConsent": "No assertion",
			"anonymizedData": {
				"label": "No assertion"
			},
			"privacyConsiderations": "No assertion"
		},
		"provenance": {
			"narrative": "The Teahouse started as an editor engagement initiative and Fellowship project.It was launched in February 2012 by a small team working with the Wikimedia Foundation.Our intention was to pilot a new, scalable model for teaching Wikipedia newcomers the ropes of editing in a friendly and engaging environment. The ultimate goal of the pilot project was to increase the retention of new Wikipedia editors(most of whom give up and leave within their first 24 hours post - registration) through early proactive outreach.The project was particularly focused on retaining female newcomers, who are woefully underrepresented among the regular contributors to the encyclopedia."
		},
		"publications": {
			"publication": "No assertion"
		},
		"locations": {
			"location": {
				"url": "",
				"comment": ""
			}
		},
		"files": {
			"file": {
				"name": "teahouse - questions20140223.csv"
			},
			"format": ".csv",
			"abstract": "Metadata for 5,003 questions",
			"size": "No assertion",
			"url": "No assertion",
			"checksum": "No assertion"
		},
		"permissions": "No assertion"
	},
	"dates": {
		"date": {
			"date": "2014 - 02 - 15"
		},
		"label": "Created"
	},
	"creators": {
		"creator": {
			"name": "Jonathan Morgan",
			"role": {
				"label": "Other"
			}
		},
		"type": {
			"label": "No assertion"
		},
		"contact": "jmorgan@wikimedia.org"
	}
}', 
updatedjson = '00001_update.json'
where userid = '00001';
