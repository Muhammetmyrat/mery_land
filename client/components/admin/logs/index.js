import Vue from "vue";

//UI components
import MainForm from "@/components/admin/logs/MainForm";
import FormHeader from "@/components/admin/logs/FormHeader";
import LogInput from "@/components/admin/logs/LogInput";
import LogButton from "@/components/admin/logs/LogButton";
import LogButtonForm from "@/components/admin/logs/LogButtonForm";
import LogFooter from "@/components/admin/logs/LogFooter";

const components = {
  MainForm,
  FormHeader,
  LogInput,
  LogButton,
  LogButtonForm,
  LogFooter,
};
const ui = Object.entries(components).forEach(([name, component]) => {
  Vue.component(name, component);
});

export default {};
