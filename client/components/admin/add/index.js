import Vue from "vue";

//UI components
import AddContainer from "@/components/admin/add/AddContainer";
import GoBackButton from "@/components/admin/add/GoBackButton";
import ContentBlock from "@/components/admin/add/ContentBlock";
import ContentBlockTitle from "@/components/admin/add/ContentBlockTitle";
import ContentBlockForm from "@/components/admin/add/ContentBlockForm";
import ContentBlockPhoto from "@/components/admin/add/ContentBlockPhoto";
import ContentBlockPhoto2 from "@/components/admin/add/ContentBlockPhoto2";
import ContentBlockTextInput from "@/components/admin/add/ContentBlockTextInput";
import ContentBlockTextArea from "@/components/admin/add/ContentBlockTextArea";
import ContentBlockSubmitButton from "@/components/admin/add/ContentBlockSubmitButton";

const components = {
  AddContainer,
  GoBackButton,
  ContentBlock,
  ContentBlockTitle,
  ContentBlockForm,
  ContentBlockPhoto,
  ContentBlockPhoto2,
  ContentBlockTextInput,
  ContentBlockTextArea,
  ContentBlockSubmitButton,
};
const ui = Object.entries(components).forEach(([name, component]) => {
  Vue.component(name, component);
});

export default {};
