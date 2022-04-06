<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>

      <ContentBlockForm>
        <ContentBlockPhoto @changePhoto="newsPhotoSelect" :img="image" />
        <!------------Text Input------------->
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle1" />
        <ContentBlockTextInput v-model="title2" @updateInput="updateTitle2" />
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
      title2: "",
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-products-header/${this.id}` });
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
      let Dates = some.data.data;
      this.image = some.data.image_path;
      this.title1 = Dates.lang_name;
      this.title2 = Dates.title;
      return Dates;
    },

    newsPhotoSelect(photo) {
      this.image = photo;
    },

    updateTitle1(update) {
      this.title1 = update;
    },
    updateTitle2(update) {
      this.title2 = update;
    },

    cycleInDates() {
      let formData = new FormData();
      formData.append("id", this.id);
      formData.append("image", this.image);
      formData.append("lang_name", this.title1);
      formData.append("title", this.title2);
      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-products-header",
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
