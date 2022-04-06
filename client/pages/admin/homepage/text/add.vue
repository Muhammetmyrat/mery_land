<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>

      <ContentBlockForm>
        <ContentBlockPhoto @changePhoto="newsPhotoSelect" />
        <!------------Lang Input------------->
        <ContentBlockTextInput v-model="title1" @updateInput="updateLangName" />
        <!------------Text Input------------->
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle1" />
        <ContentBlockTextInput v-model="title2" @updateInput="updateTitle2" />
        <ContentBlockTextInput
          v-model="stat_title"
          @updateInput="updateStatTitle"
        />
        <!------------Text Area------------->
        <ContentBlockTextArea v-model="text1" @updateTextarea="updateText1" />
        <ContentBlockTextArea v-model="text2" @updateTextarea="updateText2" />
        <ContentBlockSubmitButton>Goş</ContentBlockSubmitButton>
      </ContentBlockForm>
    </ContentBlock>
  </AddContainer>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  layout: "admin",
  async mounted() {
    // await this.forTextarea();
  },
  data() {
    return {
      lang_name: "",
      text1: "",
      text2: "",
      title1: "",
      title2: "",
      stat_title: "",
      image: null,
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.addNewHomepageSlider();
  },

  beforeDestroy() {
    this.destroyCreate();
  },
  computed: {
    //
  },
  methods: {
    ...mapActions("admin", ["fetchAuthToken", "deleteOrCreateOrUpdateOneData"]),

    /*----------------Update Lang-------------------*/
    updateLangName(update) {
      this.lang_name = update;
    },

    /*----------------Update title-------------------*/
    updateTitle1(update) {
      this.title1 = update;
    },
    updateTitle2(update) {
      this.title2 = update;
    },
    updateStatTitle(update) {
      this.stat_title = update;
    },
    /*----------------Update texts-------------------*/
    updateText1(update) {
      this.text1 = update;
    },
    updateText2(update) {
      this.text2 = update;
    },
    /*----------------Select Photo-------------------*/
    newsPhotoSelect(photo) {
      this.image = photo;
    },

    cycleInDates() {
      let formData = new FormData();
      formData.append("lang_name", this.lang_name);
      formData.append("text1", this.text1);
      formData.append("text2", this.text2);
      formData.append("title1", this.title1);
      formData.append("title2", this.title2);
      formData.append("statistica_title", this.stat_title);
      return formData;
    },

    async addNewHomepageSlider() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "add-hometexts",
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
