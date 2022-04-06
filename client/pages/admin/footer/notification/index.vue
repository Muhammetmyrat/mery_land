<template>
  <Container>
    <!-- <MyButton :link="'text/add'" :title="'Baş sahypa slider'">
      Taze Dili
    </MyButton> -->
    <div class="basic-tb-hd">
      <h2>Bildirişler</h2>
    </div>
    <Table>
      <tr>
        <TBodyTH> Dili</TBodyTH>
        <TBodyTH> Bildiriş - 1</TBodyTH>
        <TBodyTH> Bildiriş - 2</TBodyTH>
        <TBodyTH> Bildiriş - 3</TBodyTH>
        <TBodyTH> Bildiriş - 4</TBodyTH>
        <TBodyTH> Funksiyalar</TBodyTH>
      </tr>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyTD>{{ item.lang_name }}</TBodyTD>
          <TBodyTD>{{ item.report1 }}</TBodyTD>
          <TBodyTD>{{ item.report2 }}</TBodyTD>
          <TBodyTD>{{ item.report3 }}</TBodyTD>
          <TBodyTD>{{ item.report4 }}</TBodyTD>
          <TBodyFunction>
            <MyLink :link="`text/${item.id}`" />
            <!-- <TBodyButton :item="item" @remove="removeItem" /> -->
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
    await this.fetchDates("get-reports");
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
        url: "delete-reports",
        data: formDates,
      });
    },
  },
};
</script>
