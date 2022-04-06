<template>
  <AddContainer>
    <GoBackButton>Back</GoBackButton>
    <ContentBlock>
      <ContentBlockTitle>Slider goşmak</ContentBlockTitle>
      <ContentBlockForm>
        <!------------Change Photo------------->
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
    await this.fetchGetOneData({ url: `get-about-slider/${this.id}` });
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
      this.image =
        some.data &&
        some.data.data &&
        some.data.data[0] &&
        some.data.data[0].image_path;
    },
    //Methods get info from Emits
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
    //Treatment dates from State
    /**--------------------------------------*/
    /*--------------------------------------*/
    /*--------------------------------------*/
    async addNewElement() {
      await this.$nuxt.$on("create", async () => {
        let Dates = await this.cycleInDates();

        this.deleteOrCreateOrUpdateOneData({
          url: "save-about-slider",
          data: Dates,
        });
        console.log("ALL OK");
      });
    },

    destroyCreate() {
      this.$nuxt.$off("create");
    },
  },
  // getPhoto() {
  //   if (typeof this.img == "string") {
  //     console.log("UPS 1", this.img);
  //     return `http://10.192.3.70:3000/api${this.img}`;
  //   } else if (typeof this.img == "object" && this.img !== null) {
  //     console.log("UPS 2");
  //     let reader = new FileReader();
  //     reader.onload = (e) => {
  //       e.target.result;
  //     };
  //     setTimeout(() => {
  //       console.log(reader);
  //       reader.readAsDataURL(this.img);
  //       this.image = reader.result;
  //     }, 300);
  //     return reader.result;
  //   } else {
  //     console.log("UPS 3");
  //     return "/_nuxt/assets/test.jpg";
  //   }
  // },
};
</script>
