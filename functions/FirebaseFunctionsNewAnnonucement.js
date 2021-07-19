exports.newAnnouncement = functions
    .firestore
    .document('announcements/{docID}')
    .onCreate((snapshot, context) => {
        var message = "New Annoucement: " + snapshot.data().message;
        var payload = {
            notification: {
                title: 'New Announcement',
                body: message
            },
            topic: 'announcements'
          };
        return admin.messaging()
                    .send(payload, true) // Send the push in dry-run mode
                    .then(response => {
                        console.log('push success: ' + response);
                        return null;
                    });
    });