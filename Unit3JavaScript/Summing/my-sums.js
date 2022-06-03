
function range(start, end, step = 1){
    let array1 = [];
   
    if(start <= end ){
        if (step < 1)
        {
            return array1
        }
    for (let n = start; n <= end; n += step) {
        array1.push(n);
       }
       return array1;
    }

    if (start > end){
        if (step > 1)
        {
            return array1
        }
        if(step < 0){
            step = step * -1;
        }
        for (let n = start; n >= end; n -= step) {
            array1.push(n);
           }
           return array1;
    }
    
}

function sum(array2){
   var sum = 0;
    for (let n = 0; n < array2.length; n++) {
        sum += array2[n];
    }
return sum;
}
array3 = [1,2,3,4,5,6];
console.log(sum(array3)); 

//console.log(range(10,1,-2)); // [1 2 3 4 5]


exports.range = range;
exports.sum = sum;
