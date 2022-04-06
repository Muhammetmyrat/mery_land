<template>
  <Container>
    <!-- <MyButton :link="'text/add'" :title="'Baş sahypa slider'">
      Taze Dili
    </MyButton> -->
    <div class="basic-tb-hd">
      <h2>Footeriň sözleri</h2>
    </div>
    <Table>
      <thead>
        <tr>
          <TBodyTH> Dili </TBodyTH>
          <TBodyTH> Title - 1 </TBodyTH>
          <TBodyTH> Title - 2 </TBodyTH>
          <TBodyTH> Title - 3 </TBodyTH>
          <TBodyTH> Title - 4 </TBodyTH>
          <TBodyTH> Title - 5 </TBodyTH>
          <TBodyTH> Funksiyalar </TBodyTH>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyTD>{{ item.lang_name }}</TBodyTD>
          <TBodyTD>{{ item.title1 }}</TBodyTD>
          <TBodyTD>{{ item.title2 }}</TBodyTD>
          <TBodyTD>{{ item.title3 }}</TBodyTD>
          <TBodyTD>{{ item.title4 }}</TBodyTD>
          <TBodyTD>{{ item.title5 }}</TBodyTD>
          <TBodyFunction>
            <MyLink :link="`text/${item.id}`" />
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
    await this.fetchDates("get-footer-titles");
    await this.takeArr;
  },
  computed: {
    ...mapGetters("admin", ["getDates"]),
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
    async removeHomeSlider(some) {
      this.arr = this.arr.filter((i) => i.id !== some.id);
      let formDates = new FormData();
      formDates.append("id", some.id);
      this.deleteOrCreateOrUpdateOneData({
        url: "delete-footer-titles",
        data: formDates,
      });
    },
  },
};
</script>
