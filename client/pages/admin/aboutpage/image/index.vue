<template>
  <Container>
    <!-- <MyButton :title="'Hyzmatdaşlar'" :link="'about/add'"
      >Hyzmatdaş goş</MyButton
    > -->
    <div class="basic-tb-hd">
      <h2>Biz barada sahypa esasy suratlar</h2>
    </div>
    <Table>
      <thead>
        <tr>
          <TBodyTH> Biz barada sahypanyň ýokardaky suraty</TBodyTH>
          <TBodyTH> Biz barada sahypanyň aşakdaky suraty</TBodyTH>
          <TBodyTH> Funksiyalar</TBodyTH>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyIMG3 :img="item" :keyImage="'image1'" />
          <TBodyIMG3 :img="item" :keyImage="'image2'" />
          <TBodyFunction>
            <MyLink :link="`image/${item.id}`" />
            <!-- <TBodyButton :item="item" @remove="removeHomeSlider" /> -->
          </TBodyFunction>
        </tr>
      </tbody>
    </Table>
  </Container>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  layout: "admin",
  data() {
    return {
      arr: "",
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchDates("get-about-main-images");
    await this.sortedImgArray();
    this.takeArr2;
  },
  computed: {
    ...mapGetters("admin", ["getTHeadHomePartners", "getDates", "getImgArray"]),

    takeArr2() {
      this.arr = this.getImgArray;
    },
  },
  methods: {
    ...mapActions("admin", [
      "fetchAuthToken",
      "fetchDates",
      "sortedImgArray",
      // "deleteOrCreateOrUpdateOneData",
    ]),
    //
    // async removeHomeSlider(slider) {
    //   this.arr = this.arr.filter((i) => i.id !== slider.id);
    //   let formDates = new FormData();
    //   formDates.append("id", slider.id);
    //   this.deleteOrCreateOrUpdateOneData({
    //     url: "delete-about-slider",
    //     data: formDates,
    //   });
    // },
  },
};
</script>
