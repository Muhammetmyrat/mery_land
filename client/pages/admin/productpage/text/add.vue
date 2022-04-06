<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>

      <ContentBlockForm>
        <ContentBlockPhoto @changePhoto="newsPhotoSelect" :img="image" />
        <!------------Text Input------------->
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle1" />
        <ContentBlockTextArea v-model="text1" @updateTextarea="updateText1" />
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
      image: null,
      title1: "",
      text1: "",
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
    ...mapActions("admin", [
      "fetchAuthToken",
      "fetchGetOneData",
      "deleteOrCreateOrUpdateOneData",
      //"newPhotoSelect",
    ]),

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    newsPhotoSelect(photo) {
      this.image = photo;
    },

    updateTitle1(update) {
      this.title1 = update;
    },

    updateText1(update) {
      this.text1 = update;
    },

    cycleInDates() {
      let formData = new FormData();
      formData.append("category_id", this.id);
      formData.append("image", this.image);
      formData.append("lang_name", this.title1);
      formData.append("title1", this.text);
      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "add-contact-body",
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
