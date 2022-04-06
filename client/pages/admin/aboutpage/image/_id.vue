<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>
      <ContentBlockForm>
        <!------------Change Photo------------->
        <ContentBlockPhoto @changePhoto="newsPhotoSelect1" :img="image1" />
        <ContentBlockPhoto @changePhoto="newsPhotoSelect2" :img="image2" />
        <!------------Text Input------------->
        <!-- <ContentBlockTextInput v-model="title" @updateInput="updateTitle" /> -->
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
      image1: null,
      image2: null,
      id1: "",
      id2: "",
      title: "",
    };
  },
  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-about-main-images/${this.id}` });
    await this.forInDates(this.getGetteredDates);
    await this.addNewElement();
  },

  async beforeDestroy() {
    await this.destroyCreate();
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

    forInDates(some) {
      console.log("for in dates ok");
      this.image1 = some.data.data[0].image_path;
      this.image2 = some.data.data[1].image_path;
      // let obj = some.data.data.find((item) => {
      //   item.id == this.id;
      // });
      // this.image1 = obj.image;
      // this.image2 = obj.image2;
      this.id1 = some.data.data[0].id;
      this.id2 = some.data.data[1].id;
    },

    newsPhotoSelect1(photo) {
      this.image1 = photo;
    },
    newsPhotoSelect2(photo) {
      this.image2 = photo;
    },

    cycleInDates() {
      let formDates = new FormData();
      formDates.append("id1", this.id1);
      formDates.append("id2", this.id2);
      formDates.append("image1", this.image1);
      formDates.append("image2", this.image2);
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
          url: "save-about-main-images",
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
