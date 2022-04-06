import Vue from "vue";

//UI components
import Container from "@/components/admin/content/Container";
import Table from "@/components/admin/content/Table";

//UI components
import TBodyTD from "@/components/admin/content/TableBodyTD";
import TBodyIMG from "@/components/admin/content/TableBodyIMG";
import TBodyIMG2 from "@/components/admin/content/TableBodyIMG2";
import TBodyIMG3 from "@/components/admin/content/TableBodyIMG3";
import TBodyButton from "@/components/admin/content/TableBodyButton";
import TBodyFunction from "@/components/admin/content/TableBodyFunction";
import TBodyTH from "@/components/admin/content/TableHeadTH";

const components = {
  Container,
  Table,
  /**/
  TBodyTD,
  TBodyIMG,
  TBodyIMG2,
  TBodyIMG3,
  TBodyButton,
  TBodyFunction,
  TBodyTH,
};
const ui = Object.entries(components).forEach(([name, component]) => {
  Vue.component(name, component);
});

export default {};

// let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9];
// let arr2 = [];

// let obj1 = new Object();
// obj1.image1 = new Number();
// obj1.image2 = new Number();
// obj1.num = new Number();

// let obj2 = new Object();
// obj2.image1 = new Number();
// obj2.image2 = new Number();
// obj2.num = new Number();
// for (let i in arr) {
//   if (obj2.image1 == 0) {
//     obj2.image1 = arr[i];
//     console.log("1", obj2.image1);
//   } else if (obj2.image2 == 0) {
//     obj2.image2 = arr[i];
//     console.log("2", obj2.image2);
//   } else if (obj2.num == 0) {
//     obj2.num = arr[i];
//     console.log("3", obj2.num);
//     arr2.push(obj2);
//     obj2 = obj1;
//   }
// }

// for (let i in arr) {
//   let obj2 = new Object();
//   obj2.image1 = new String();
//   if (obj2.image1 == 0) {
//     obj2.num = arr[i];
//     console.log(obj.num);
//     arr2.push(obj2);
//   }
// }
