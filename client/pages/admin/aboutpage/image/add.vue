<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>
      <ContentBlockForm>
        <ContentBlockPhoto @changePhoto="newsPhotoSelect" :img="image" />
        <!------------NEED NEW FORM FOR REGISTER IMAGE------------->
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
      image: null,
      image2: null,
      title: "",
    };
  },
  async mounted() {
    await this.fetchAuthToken();
    await this.addNewElement();
  },

  async beforeDestroy() {
    await this.destroyCreate();
  },
  methods: {
    ...mapActions("admin", ["fetchAuthToken", "deleteOrCreateOrUpdateOneData"]),
    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    //Methods get info from Emits
    newsPhotoSelect(photo) {
      this.image = photo;
    },
    newsPhotoSelect2(photo) {
      this.image2 = photo;
    },
    // updateTitle(update) {
    //   this.title = update;
    // },

    cycleInDates() {
      let formDates = new FormData();
      formDates.append("image", this.image);
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
          url: "add-about-main-images",
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
