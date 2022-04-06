<template>
  <Container>
    <MyButton :title="'Biz barada sahypa slider'" :link="'slider/add'">
      Slider goş</MyButton
    >
    <Table>
      <thead>
        <tr>
          <TBodyTH> Slideriň suraty</TBodyTH>
          <TBodyTH> Funksiyalar</TBodyTH>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyIMG :img="item" />
          <TBodyFunction>
            <MyLink :link="`slider/${item.id}`" />
            <TBodyButton :item="item" @remove="removeItem" />
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
    await this.fetchDates("get-about-slider");
    this.takeArr;
  },
  computed: {
    ...mapGetters("admin", ["getTHeadHomePartners", "getDates"]),
    takeArr() {
      this.arr = this.getDates;
      // console.log("ARR", this.arr);
    },
  },
  methods: {
    ...mapActions("admin", [
      "fetchAuthToken",
      "fetchDates",
      "deleteOrCreateOrUpdateOneData",
    ]),
    //
    async removeItem(slider) {
      this.arr = this.arr.filter((i) => i.id !== slider.id);
      let formDates = new FormData();
      formDates.append("id", slider.id);
      this.deleteOrCreateOrUpdateOneData({
        url: "delete-about-slider",
        data: formDates,
      });
    },
  },
};
</script>
