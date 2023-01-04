// $(document).ready(function () {
//     // var drake = dragula({...});

// function updateMyObject(elementId, listId) {
//   // update the object here, for example:
//   if (listId === 'firstList') {
//     // use the element id to find the item in your object and update it
//     myDataObject.filter(function(x) {
//       return x.id === elementId;
//     })[0].propertyToUpdate = listId;
//   }
// }

$(document).ready(function () {
    dragula().on('drop', function (el) {
        alert("Hello! I am an alert box!!");
        // document.getElementById(left), document.getElementsById(right), {
        //     copy: true,
        //        };
                             
});
});
// var $scope 
// dragula($scope, 'tasks', {
//     revertOnSpill: true
// });

// $scope.$on('tasks.drop', function (e, el, target, source) {
//     if (target[0].id === "done" && source[0].id !== "done") {
//         UIkit.modal.confirm("Are you sure?", function(){}, function(){
//             $(el).remove();
//             $(source).append(el);
//         });
//     }
// });
// });




  
// //     console.log("custom file load ")
// //     drake.on('drop',function(el,target,source,sibling){
// //         console.log("droppppppppppppppppppppppppppppppppppppp")
// //         })
  
// });

// function $(id) {
//     return document.getElementById(id);
//   }
  
//   dragula([$('drag-elements'), $('drop-target')], {
//     revertOnSpill: true
//   }).on('drop', function(el) {
//     debugger
//     if ($('drop-target').children.length > 0) {
//       $('display').innerHTML = $('drop-target').innerHTML;
//     } else {
//       $('display').innerHTML = "Display";
//     }
  
//   });
  


// dragula([left, right]).on('drag', function (el) {
//   el.className = el.className.replace(' animazing', '');
// }).on('drop', function (el) {
//   setTimeout(function () {
//     el.className += ' animazing';
//   }, 0);
// });