<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>
      <ContentBlockForm>
        <ContentBlockPhoto @changePhoto="newsPhotoSelect1" :img="image" />
        <ContentBlockPhoto @changePhoto="newsPhotoSelect2" :img="image2" />
        <ContentBlockPhoto @changePhoto="newsPhotoSelect3" :img="image3" />
        <!------------Text Input------------->
        <!-- <ContentBlockTextInput v-model="title" @updateInput="updateTitle" /> -->
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
      title1: "",
      title2: "",
      image: null,
      image2: null,
      image3: null,
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-setings/${this.id}` });
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

    /*!--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    newsPhotoSelect1(photo) {
      this.image1 = photo;
    },
    newsPhotoSelect2(photo) {
      this.image2 = photo;
    },
    newsPhotoSelect3(photo) {
      this.image3 = photo;
    },

    updateTitle1(update) {
      this.title1 = update;
    },
    updateTitle2(update) {
      this.title2 = update;
    },

    forInDates(some) {
      let Dates = some.data.data[0];
      this.title1 = Dates.email;
      this.title2 = Dates.whatsapp;
      this.image1 = Dates.logo;
      this.image2 = Dates.logo_black;
      this.image3 = Dates.favicon;
      return Dates;
    },

    cycleInDates() {
      let formData = new FormData();
      formData.append("id", this.id);
      formData.append("email", this.title1);
      formData.append("whatsapp", this.title2);
      formData.append("logo", this.image1);
      formData.append("logo_black", this.image2);
      formData.append("favicon", this.image3);
      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-setings",
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
