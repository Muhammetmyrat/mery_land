<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>
      <ContentBlockForm>
        <ContentBlockPhoto @changePhoto="newsPhotoSelect" :img="image" />
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
      title: "",
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-partners/${this.id}` });
    await this.forInDates(this.getGetteredDates);
    this.addNewElement();
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

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    forInDates(some) {
      this.image = some.data.data[0].image_path;
    },

    newsPhotoSelect(photo) {
      this.image = photo;
    },

    //
    cycleInDates() {
      let formDates = new FormData();
      formDates.append("id", this.id);
      formDates.append("image", this.image);
      //formDates.append("partner", this.title);
      return formDates;
    },

    //Take photo file and push it in data

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-partners",
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
