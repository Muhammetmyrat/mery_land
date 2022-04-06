<template>
  <Container>
    <div class="basic-tb-hd">
      <h2>Baş sahypanyň tekstleri</h2>
    </div>

    <Table>
      <thead>
        <tr>
          <TBodyTH> Dili</TBodyTH>
          <TBodyTH> Statistic</TBodyTH>
          <TBodyTH> Title - 1</TBodyTH>
          <TBodyTH> Content - 1</TBodyTH>
          <TBodyTH> Title - 2</TBodyTH>
          <TBodyTH> Content - 2</TBodyTH>
          <TBodyTH> Funksiyalar</TBodyTH>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyTD>{{ item.lang_name }}</TBodyTD>
          <TBodyTD>{{ item.statistica_title }}</TBodyTD>
          <TBodyTD>{{ item.title1 }}</TBodyTD>
          <TBodyTD>{{ item.text1 }}</TBodyTD>
          <TBodyTD>{{ item.title2 }}</TBodyTD>
          <TBodyTD>{{ item.text1 }}</TBodyTD>
          <TBodyFunction>
            <MyLink :link="`text/${item.id}`" />
          </TBodyFunction>
        </tr>
      </tbody>
    </Table>
  </Container>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
export default {
  name: "homepage-text",
  layout: "admin",
  data() {
    return {
      arr: "",
    };
  },

  async mounted() {
    await this.fetchAuthToken();
    await this.fetchDates("get-hometexts");
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
    async removeItem(item) {
      this.arr = this.arr.filter((i) => i.id !== item.id);
      let formDates = new FormData();
      formDates.append("id", item.id);

      this.deleteOrCreateOrUpdateOneData({
        url: "delete-hometexts",
        data: formDates,
      });
    },
  },
};
</script>
