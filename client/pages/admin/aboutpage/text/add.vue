<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Biz barada tekstleri</ContentBlockTitle>
      <ContentBlockForm>
        <!------------Text Input------------->
        <ContentBlockTextInput
          v-model="lang_name"
          @updateInput="updateLangName"
        />
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle1" />
        <ContentBlockTextArea v-model="text1" @updateInput="updateText1" />
        <ContentBlockTextInput v-model="title2" @updateInput="updateTitle2" />
        <ContentBlockTextArea v-model="text2" @updateInput="updateText2" />
        <ContentBlockTextInput
          v-model="button_text"
          @updateInput="updateButton_text"
        />
        <ContentBlockSubmitButton>Goş</ContentBlockSubmitButton>
      </ContentBlockForm>
    </ContentBlock>
  </AddContainer>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  layout: "admin",
  data() {
    return {
      lang_name: "",
      text1: "",
      text2: "",
      title1: "",
      title2: "",
      button_text: "",
    };
  },
  async mounted() {
    await this.fetchAuthToken();
    await this.addNewElement();
  },

  beforeDestroy() {
    this.destroyCreate();
  },
  methods: {
    ...mapActions("admin", ["fetchAuthToken", "deleteOrCreateOrUpdateOneData"]),
    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    //Methods get info from Emits

    // updateTitle(update) {
    //   this.title = update;
    // },
    updateLangName(data) {
      this.lang_name = data;
    },
    updateTitle1(data) {
      this.title1 = data;
    },
    updateTitle2(data) {
      this.title2 = data;
    },
    updateText1(data) {
      this.text1 = data;
    },
    updateText2(data) {
      this.text2 = data;
    },
    updateButton_text(data) {
      this.button_text = data;
    },

    cycleInDates() {
      let formDates = new FormData();
      formDates.append("id", this.id);
      formDates.append("lang_name", this.lang_name);
      formDates.append("text1", this.text1);
      formDates.append("text2", this.text2);
      formDates.append("title1", this.title1);
      formDates.append("title2", this.title2);
      formDates.append("button_text", this.button_text);
      //formDates.append("partner", this.title);
      return formDates;
    },
    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "add-about-body",
          data: Dates,
        });
        console.log("ALL OK");
      });
    },
    destroyCreate() {
      this.$nuxt.$off("create");
    },
  },
};
</script>
