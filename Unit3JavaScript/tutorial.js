function square1 (x){

    return x*x;
}

const square2 = (x) => {return x*x};

var square3 = function (x) {return (x * x)};
//Drops extra paramiters
console.log(square3(2, 3, 4));

function listMyPets(owner,...pets){
    console.log(`${owner} has these pets:`);
    for (let i=0; i<pets.length; i++){
    console.log(`${pets[i]}`);
    }
   }
   listMyPets("Geoff","Zipper","Buttons");


