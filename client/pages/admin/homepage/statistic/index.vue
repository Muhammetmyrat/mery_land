<template>
  <Container>
    <MyButton :link="'statistic/add'" :title="'Baş sahypa slider'">
      Slider goş
    </MyButton>
    <Table>
      <thead>
        <tr>
          <TBodyTH> Dili </TBodyTH>
          <TBodyTH> Salgy </TBodyTH>
          <TBodyTH> Salgy </TBodyTH>
          <TBodyTH> Salgy </TBodyTH>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyTD>{{ item.title }}</TBodyTD>
          <TBodyTD>{{ item.amount }}</TBodyTD>

          <TBodyIMG :img="item" />
          <TBodyFunction>
            <MyLink :link="`statistic/${item.id}`" />
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
    await this.fetchDates("get-statistica");
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
        url: "delete-statistica",
        data: formDates,
      });
    },
  },
};
</script>
