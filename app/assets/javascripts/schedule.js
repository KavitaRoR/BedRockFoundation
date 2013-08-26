var schedule = angular.module('schedule', ['firebase', 'filters']);

schedule.controller('ScheduleCtrl', ['$scope', 'angularFire', 'filterFilter',
  function ScheduleCtrl($scope, angularFire, filterFilter) {
    var contracts_url = 'https://bedrock.firebaseio.com/contracts';
    var contracts_promise = angularFire(contracts_url, $scope, 'contracts', {});

    var crews_url = 'https://bedrock.firebaseio.com/crews';
    var crews_promise = angularFire(crews_url, $scope, 'crews', {});

    var notes_url = 'https://bedrock.firebaseio.com/notes';
    var note_promise = angularFire(notes_url, $scope, 'notes', {});

    $scope.newNote = ''
    $scope.noteTitle = 'Create a new Note'
    $scope.first_day = new Date();
    $scope.days = getDayRange($scope.first_day, 1)
    $scope.slots = [1,2,3,4,5,6];

    contracts_promise.then(function(contracts) {
      startWatchContracts($scope, filterFilter);
    });
    crews_promise.then(function(crews) {
      startWatchCrews($scope, filterFilter);
    });

    note_promise.then(function(notes) {
      startWatchNotes($scope, filterFilter);
    });
  }
]);


function startWatchCrews($scope, filter) {
  $scope.$watch('crews', function () {
    console.log($scope.crews)
    // $scope.remainingCount = filter($scope.todos, {completed: false}).length;
    // $scope.completedCount = $scope.todos.length - $scope.remainingCount;
    // $scope.allChecked = !$scope.remainingCount;
  }, true);

}

function startWatchContracts($scope, filter) {
  $scope.$watch('contracts', function () {
    console.log($scope.contracts.length)
    // $scope.remainingCount = filter($scope.todos, {completed: false}).length;
    // $scope.completedCount = $scope.todos.length - $scope.remainingCount;
    // $scope.allChecked = !$scope.remainingCount;
  }, true);

  // $scope.$watch('location.path()', function (path) {
  //   $scope.statusFilter = (path === '/active') ?
  //     { completed: false } : (path === '/completed') ?
  //     { completed: true } : null;
  // });
  $scope.estimateModal = function() {
    console.log("estimateModal Pop-up")
  };

}

function startWatchNotes($scope, filter) {
  $scope.$watch('notes', function () {
    // $scope.remainingCount = filter($scope.todos, {completed: false}).length;
    // $scope.completedCount = $scope.todos.length - $scope.remainingCount;
    // $scope.allChecked = !$scope.remainingCount;
  }, true);

  // $scope.$watch('location.path()', function (path) {
  //   $scope.statusFilter = (path === '/active') ?
  //     { completed: false } : (path === '/completed') ?
  //     { completed: true } : null;
  // });

  $scope.noteModal = $("#editing_note");

  $scope.saveNote = function () {
    console.log("SaveNote()")
    console.log("saving to: " + $scope.posturl);

    $.ajax({
      url: $scope.posturl,
      type: $scope.method,
      data: { day_crew_block: {
        working_with_crew_id: $("#day_crew_block_working_with_crew_id").val(),
        crew_id: $("#day_crew_block_crew_id").val(),
        day: $("#day_crew_block_day").val(),
        reason: $("#day_crew_block_reason").val(),
        block_off: $("#day_crew_block_block_off").is(':checked')
      }}, 
      success: function(response) {
        console.log("Success Saving")
        console.log(response)
      }
    });

    $scope.newNote = '';
  };

  $scope.newNoteModal = function (day, crew_id) {
    console.log("openNoteModal")
    $scope.noteTitle = 'Create a new Note'
    $scope.posturl = "/day_crew_blocks.json"
    $scope.method = "POST"
    var container = $($scope.noteModal);
    container.find("#day_crew_block_day").val(day.toJSON().split('T')[0]);
    container.find("#day_crew_block_crew_id").val(crew_id);
    container.find("#day_crew_block_crew_id").change();
  };
  $scope.editNoteModal = function (note) {
    console.log("editNoteModal")
    console.log(note)
    $scope.noteTitle = 'Edit this Note'
    $scope.posturl = "/day_crew_blocks/"+note.id+".json"
    $scope.method = "PUT"
    var container = $($scope.noteModal);
    $.getJSON("/day_crew_blocks/"+note.id+".json", function(result) {
      console.log(result)
      container.find("form").attr("action", "/day_crew_blocks/"+result.id)
      container.find("#day_crew_block_working_with_crew_id").val(result.working_with_crew_id)
      container.find("#day_crew_block_working_with_crew_id").change();
      container.find("#day_crew_block_day").val(result.day.split("T")[0])
      container.find("#day_crew_block_reason").val(result.reason)
      container.find("#day_crew_block_crew_id").val(result.crew_id)
      container.find("#day_crew_block_crew_id").change();
      if (result.block_off == "true" || result.block_off == true){
        container.find("#day_crew_block_block_off").attr("checked", "checked")
      } else {
        container.find("#day_crew_block_block_off").removeAttr("checked")
      }
    })

  };


  $scope.doneEditing = function (note) {
    $scope.editedNote = null;
    if (!note.reason) {
      $scope.removeNote(note);
    }
  };

  $scope.removeNote = function (note) {
    $scope.notes.splice($scope.notes.indexOf(note), 1);
  };

}

function getDayRange(first_day, weeks) {
  var days = [];
  first_day.setHours(0);
  first_day.setMinutes(0);
  first_day.setSeconds(0);
  first_day.setMilliseconds(0);
  days.push(new Date(first_day));

  for (var i = 0; i < weeks; i++) {
    for (var j = 0; j < 7; j++) {
      var dnum = j + (i * 7);
      var day = first_day;
      day.setDate(first_day.getDate() + 1 );
      days.push(new Date(day));
    }
  }
  return days;
}

function getWeekDay(day) {
  alert(day)
  var weekday=new Array(7);
  weekday[0]="Sunday";
  weekday[1]="Monday";
  weekday[2]="Tuesday";
  weekday[3]="Wednesday";
  weekday[4]="Thursday";
  weekday[5]="Friday";
  weekday[6]="Saturday";
  return weekday[day.getDay()];
}


angular.module('utils', [])
  .factory('utils', function(){
    return{
      compareStr: function(stra, strb){
        stra = ("" + stra).toLowerCase();
        strb = ("" + strb).toLowerCase();
        return stra.indexOf(strb) !== -1;
      }
    };
  });

angular.module('filters',['utils'])
  .filter('crewFilter', function(utils){
    
    return function(input, crew_id){
      if(!crew_id) return input;
      var result = [];
      
      angular.forEach(input, function(item){
        if(item.crew_id == crew_id){
          result.push(item);                    
        }
      });
      return result;
    };
  })
  .filter('dayFilter', function(utils){
    
    return function(input, day){
      if(!day) return input;
      var result = [];
      
      angular.forEach(input, function(item){
        if(item.day == day){
          result.push(item);                    
        }
      });
      return result;
    };
  })
  .filter('slotFilter', function(utils){
    
    return function(input, slot){
      if(!slot) return input;
      var result = [];
      
      angular.forEach(input, function(contract){
        if(contract.slot == slot){
          result.push(contract);                    
        }
      });
      return result;
    };
  })
  .filter('orderObjectBy', function(){
    return function(input, attribute) {
      if (!angular.isObject(input)) return input;

      var array = [];
      for(var objectKey in input) {
          array.push(input[objectKey]);
      }

      array.sort(function(a, b){
          a = parseInt(a[attribute]);
          b = parseInt(b[attribute]);
          return a - b;
      });
      return array;
    }
  });;