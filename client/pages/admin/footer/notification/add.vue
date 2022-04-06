<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>

      <ContentBlockForm>
        <!------------Text Input------------->
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle" />
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle" />
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle" />
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle" />
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
      title: "",
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

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    //Methods get info from Emits
    newsPhotoSelect(photo) {
      this.image = photo;
    },

    updateTitleTR(update) {
      this.title1 = update;
    },
    updateTitleRU(update) {
      this.title2 = update;
    },

    cycleInDates() {
      let formData = new FormData();
      formData.append("category_id", this.id);
      formData.append("image", this.image);
      formData.append("name", this.title1);
      formData.append("category", this.title2);
      return formData;
    },
    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "add-products",
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
