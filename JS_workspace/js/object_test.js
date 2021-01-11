//class : object 생성하기 위한 template, type(요구사항을 추상화해서 속성과 기능을 표현한 템플릿)
//object : class type으로 생성된 변수(클래스 new 생성자를 통해 인스턴스화된 개체)
//1. class 선언(ECMA6 - class)
//class 클래스 이름{
//    변수;
//    생성자
//    매소드;
//}
class Person{
    _name="";
    _age=0;

    constructor(name, age){
        this._name=name;
        this._age=age;
    }

    print(){
        console.log(`이름 : ${this._name} 나이 : ${this._age}`)
    }
    //computed
    get brithYear(){
        return 2021-this._age+1;
    }
    //action -> action을 주어 값을 핧당한다.
    set brithYear(year){
        this._age=2021-year+1;
    }
}

let p=new Person("전대영", 28);
p.brithYear =1997;
console.log(`${p.name}님 ${p.brithYear}년 출생`);
p.print();

//2.function 객체로 선언
function student(name,age,major){
    this._name = name;
    this._age = age;
    this._major = major;
    this.print=function(){
        console.log(`이름 : ${this._name} 나이 : ${this._age} 전공 : ${this._major}`);
    }
}

let s=new student("전대영",28,"컴퓨터공학과");
s.print();

//3.JSON(Javascript Object Notation)
let e = {person: {name:'전대영', age:28}, department:'클라우드', array:[1,2,3,4], male:'true'};
let array =[{name:'전대영',age:28},1,[1,2,3,4],'name', "false","null"];
console.log(e);
