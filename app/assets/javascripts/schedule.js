var schedule = angular.module('schedule', ['firebase']);

schedule.controller('ScheduleCtrl', ['$scope', 'angularFire', 'filterFilter',
  function ScheduleCtrl($scope, angularFire, filterFilter) {
    var contracts_url = 'https://bedrock.firebaseio.com/contracts';
    var contracts_promise = angularFire(contracts_url, $scope, 'contracts', {});

    var notes_url = 'https://bedrock.firebaseio.com/notes';
    var note_promise = angularFire(notes_url, $scope, 'notes', []);

    $scope.newNote = ''
    $scope.first_day = new Date();
    $scope.days = getDayRange($scope.first_day, 1)

    contracts_promise.then(function(contracts) {
      startWatchContracts($scope, filterFilter);
    });
    note_promise.then(function(notes) {
      startWatchNotes($scope, filterFilter);
    });
  }
]);

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

  $scope.addNote = function () {
    console.log("AddNote")
    if (!$scope.newNote.length) {
      return;
    }

    $scope.notes.push({
      day: $scope.current_note_day,
      crew_id: $scope.current_note_crew_id,
      reason: $scope.newNote
    });

    $scope.newNote = '';
  };

  $scope.openNoteModal = function (day, crew_id) {
    console.log("openNoteModal")
    $scope.current_note_day = day.toJSON().split('T')[0];
    $scope.current_note_crew_id = crew_id;
  };

  $scope.editNote = function (note) {
    $scope.editedNote = note;
  };

  $scope.doneEditing = function (note) {
    $scope.editedNote = null;
    if (!note.reason) {
      $scope.removeTodo(note);
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