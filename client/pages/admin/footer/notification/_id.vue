<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>
      <ContentBlockForm>
        <!------------Text Input------------->
        <!-- <ContentBlockTextInput v-model="title" @updateInput="updateTitle" /> -->
        <ContentBlockTextInput v-model="title1" @updateInput="updateTitle1" />
        <ContentBlockTextInput v-model="title2" @updateInput="updateTitle2" />
        <ContentBlockTextInput v-model="title3" @updateInput="updateTitle3" />
        <ContentBlockTextInput v-model="title4" @updateInput="updateTitle4" />
        <ContentBlockSubmitButton>Goş</ContentBlockSubmitButton>
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
      title3: "",
      title4: "",
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-reports/${this.id}` });
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
    newsPhotoSelect(photo) {
      this.image = photo;
    },

    updateTitle1(update) {
      this.title1 = update;
    },
    updateTitle2(update) {
      this.title2 = update;
    },
    updateTitle3(update) {
      this.title3 = update;
    },
    updateTitle4(update) {
      this.title4 = update;
    },

    forInDates(some) {
      let Dates = some.data.data[0];
      this.title1 = Dates.report1;
      this.title2 = Dates.report2;
      this.title3 = Dates.report3;
      this.title4 = Dates.report4;
      return Dates;
    },

    cycleInDates() {
      let formData = new FormData();
      formData.append("id", this.id);
      formData.append("report1", this.title1);
      formData.append("report2", this.title2);
      formData.append("report3", this.title3);
      formData.append("report4", this.title4);
      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-reports",
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
