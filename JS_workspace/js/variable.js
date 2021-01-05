//1. var, let, const
//변수선언은 let 사용 -> 유효범위 구분 때문에
//상수선언은 const 사용 ->값 변경없이 read only로 사용
var x; //변수선언 var : 변수의 유효범위 구분 안되기 때문에 let을 사용
x =6; //따로 변수 선언을 하지 않아도 성립된다 -> 유연함
const constVariable=10; //const 선언 할 시 값이 변경이 안된다. -> 상수일때 사용
let globalVariable=5;   // 전역변수
{
    let localVariable =5; //지역변수
    var y=5;
    console.log("localVariable ", localVariable);
    console.log("localVariable ", globalVariable);
    console.log("var x", x);
    console.log("var y" , y);
    console.log("const", constVariable);
}
//constVariable =100; -> const로 선언 되었기 때문에 값을 변경할 수 없다.
//console.log("localVariable ", localVariable);
console.log("localVariable ", globalVariable);
console.log("var x", x);
console.log("var y" , y);
document.getElementById("data").innerHTML = "<h3>variable x ="+x+"</h3>"; 

//2.DataType = primitive(int, float, char, boolean) , Reference(Class,Array)
let intV =10;
let floatV =10.5;
let stringV ="10";
let booleanV = true;
console.log("data type" , intV,floatV,stringV,booleanV);

console.log("type : " ,typeof intV,typeof floatV,typeof stringV,typeof booleanV )

