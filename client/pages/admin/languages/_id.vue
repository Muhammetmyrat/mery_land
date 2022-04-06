<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Dili goşmak</ContentBlockTitle>

      <ContentBlockForm>
        <ContentBlockPhoto @changePhoto="newsPhotoSelect" :img="image" />
        <!------------Text Input------------->
        <ContentBlockTextInput
          v-model="fullLanguages"
          @updateInput="updateFullLanguages"
          :placeHolder="'Diliň ady'"
        />
        <ContentBlockTextInput
          v-model="shotLanguages"
          @updateInput="updateShotLanguages"
          :placeHolder="' Diliň gysga ady'"
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
      fullLanguages: "",
      shotLanguages: "",
      image: null,
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchGetOneData({ url: `get-languages/${this.id}` });
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
      let Dates = some.data.data[0];
      this.fullLanguages = Dates.name;
      this.shotLanguages = Dates.short_name;
      this.image = Dates.image_path;
      return Dates;
    },

    newsPhotoSelect(photo) {
      this.image = photo;
    },
    updateFullLanguages(update) {
      this.fullLanguages = update;
    },
    updateShotLanguages(update) {
      this.shotLanguages = update;
    },

    async cycleInDates() {
      let formData = new FormData();
      formData.append("id", this.id);
      formData.append("name", this.fullLanguages);
      formData.append("short_name", this.shotLanguages);
      formData.append("image", this.image);
      return formData;
    },

    /*--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/

    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-languages",
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
