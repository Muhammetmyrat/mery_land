<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Biz barada tekstleri</ContentBlockTitle>
      <ContentBlockForm>
        <!------------Change Photo------------->
        <!-- <ContentBlockPhoto @changePhoto="newsPhotoSelect" /> -->
        <!------------Text Input------------->
        <ContentBlockTextInput
          v-model="lang_name"
          @updateInput="updateLangName"
        />
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle1" />
        <ContentBlockTextArea v-model="text1" @updateTextarea="updateText1" />
        <ContentBlockTextInput v-model="title2" @updateInput="updateTitle2" />
        <ContentBlockTextArea v-model="text2" @updateTextarea="updateText2" />
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
  // async beforeMounted() {},

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-about-body/${this.id}` });
    await this.forInDates(this.getGetteredDates);
    await this.addNewElement();
  },

  // updated() {
  //   await this.forInDates(this.getGetteredDates);
  // },
  beforeDestroy() {
    this.destroyCreate();
  },
  computed: {
    ...mapGetters("admin", ["getGetteredDates"]),
    id() {
      return this.$route.params.id;
    },
  },
  methods: {
    ...mapActions("admin", [
      "fetchAuthToken",
      "deleteOrCreateOrUpdateOneData",
      "fetchGetOneData",
    ]),

    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
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
    // updateTitle(update) {
    //   this.title = update;
    // },

    //Treatment dates from State
    forInDates(some) {
      let Dates = some.data.data[0];
      this.lang_name = Dates.lang_name;
      this.text1 = Dates.text1;
      this.text2 = Dates.text2;
      this.title1 = Dates.title1;
      this.title2 = Dates.title2;
      this.button_text = Dates.button_text;
    },

    //Methods get info from Emits
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
    //
    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-about-body",
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
