<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>

      <ContentBlockForm>
        <!------------Change Photo------------->
        <!-- <ContentBlockPhoto @changePhoto="newsPhotoSelect" /> -->
        <!------------Lang Input------------->
        <ContentBlockTextInput
          v-model="lang_name"
          @updateInput="updateLangName"
        />
        <!------------Text Input------------->
        <ContentBlockTextInput
          v-model="stat_title"
          @updateInput="updateStatTitle"
        />
        <!------------Text Area------------->
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle1" />
        <ContentBlockTextArea v-model="text1" @updateTextarea="updateText1" />
        <ContentBlockTextInput v-model="title2" @updateInput="updateTitle2" />
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
    this.getText;
  },
  data() {
    return {
      lang_name: "",
      text1: "",
      text2: "",
      title1: "",
      title2: "",
      stat_title: "",
    };
  },
  async mounted() {
    await this.fetchAuthToken();
    //this.getSlid;
    // await this.forTextarea();
    await this.fetchGetOneData({ url: `get-hometexts/${this.id}` });
    await this.forInDates(this.getGetteredDates);
    await this.addNewElement();
  },

  beforeDestroy() {
    this.destroyCreate();
  },
  computed: {
    ...mapGetters("admin", ["getGetteredDates"]),
    id() {
      return this.$route.params.id;
    },
    //
  },
  methods: {
    ...mapActions("admin", [
      "fetchAuthToken",
      "fetchGetOneData",
      "deleteOrCreateOrUpdateOneData",
    ]),

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    forInDates(some) {
      let Dates = some.data.data[0];
      this.lang_name = Dates.lang_name;
      this.text1 = Dates.text1;
      this.text2 = Dates.text2;
      this.title1 = Dates.title1;
      this.title2 = Dates.title2;
      this.stat_title = Dates.statistica_title;
    },

    cycleInDates() {
      let formData = new FormData();
      formData.append("id", this.id);
      formData.append("lang_name", this.lang_name);
      formData.append("text1", this.text1);
      formData.append("text2", this.text2);
      formData.append("title1", this.title1);
      formData.append("title2", this.title2);
      formData.append("statistica_title", this.stat_title);
      return formData;
    },

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

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-hometexts",
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
