if (Meteor.isClient) {
  Template.hello.greeting = function () {
    return "Welcome to bedrock.";
  };

  Template.hello.events({
    'click input' : function () {
      // template data, if any, is available in 'this'
      if (typeof console !== 'undefined')
        NoteBlocks.insert({reason: "Happiness", day:"2013-02-12"});
    }
  });

  Template.hello.notes = function() {
    return NoteBlocks.find()
  };
}


Contracts = new Meteor.Collection("contracts");
Crews = new Meteor.Collection("crews");
NoteBlocks = new Meteor.Collection("note_blocks");

if (Meteor.isServer) {
  Meteor.startup(function () {

    // All values listed below are default
    collectionApi = new CollectionAPI({
      authToken: undefined,              // Require this string to be passed in on each request
      apiPath: 'api',          // API path prefix
      standAlone: false,                 // Run as a stand-alone HTTP(S) server
      sslEnabled: false,                 // Disable/Enable SSL (stand-alone only)
      listenPort: 3005,                  // Port to listen to (stand-alone only)
      listenHost: undefined,             // Host to bind to (stand-alone only)
      privateKeyFile: 'privatekey.pem',  // SSL private key file (only used if SSL is enabled)
      certificateFile: 'certificate.pem' // SSL certificate key file (only used if SSL is enabled)
    });

    // // Add the collection Players to the API "/players" path
    // collectionApi.addCollection(Contracts, 'contracts', {
    //   // All values listed below are default
    //   authToken: undefined,                   // Require this string to be passed in on each request
    //   methods: ['POST','GET','PUT','DELETE'],  // Allow creating, reading, updating, and deleting
    //   before: {  // This methods, if defined, will be called before the POST/GET/PUT/DELETE actions are performed on the collection. If the function returns false the action will be canceled, if you return true the action will take place.
    //     POST: undefined,  // function(obj) {return true/false;},
    //     GET: undefined,  // function(collectionID, objs) {return true/false;},
    //     PUT: undefined,  //function(collectionID, obj, newValues) {return true/false;},
    //     DELETE: undefined,  //function(collectionID, obj) {return true/false;}
    //   }
    // });
    // collectionApi.addCollection(Crews, 'crews', {
    //   // All values listed below are default
    //   authToken: undefined,                   // Require this string to be passed in on each request
    //   methods: ['POST','GET','PUT','DELETE'],  // Allow creating, reading, updating, and deleting
    //   before: {  // This methods, if defined, will be called before the POST/GET/PUT/DELETE actions are performed on the collection. If the function returns false the action will be canceled, if you return true the action will take place.
    //     POST: undefined,  // function(obj) {return true/false;},
    //     GET: undefined,  // function(collectionID, objs) {return true/false;},
    //     PUT: undefined,  //function(collectionID, obj, newValues) {return true/false;},
    //     DELETE: undefined,  //function(collectionID, obj) {return true/false;}
    //   }
    // });
    // collectionApi.addCollection(NoteBlocks, 'note_blocks', {
    //   // All values listed below are default
    //   authToken: undefined,                   // Require this string to be passed in on each request
    //   methods: ['POST','GET','PUT','DELETE'],  // Allow creating, reading, updating, and deleting
    //   before: {  // This methods, if defined, will be called before the POST/GET/PUT/DELETE actions are performed on the collection. If the function returns false the action will be canceled, if you return true the action will take place.
    //     POST: undefined,  // function(obj) {return true/false;},
    //     GET: undefined,  // function(collectionID, objs) {return true/false;},
    //     PUT: undefined,  //function(collectionID, obj, newValues) {return true/false;},
    //     DELETE: undefined,  //function(collectionID, obj) {return true/false;}
    //   }
    // });

    // // Starts the API server
    collectionApi.start();
  });
}