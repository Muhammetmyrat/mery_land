import Vue from "vue";

//UI components
import MyButton from "@/components/admin/UI/MyButton";
import MyLink from "@/components/admin/UI/MyLink";

const components = { MyButton, MyLink };
const ui = Object.entries(components).forEach(([name, component]) => {
  Vue.component(name, component);
});

export default {};
