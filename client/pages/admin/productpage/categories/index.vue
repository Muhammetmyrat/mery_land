<template>
  <Container>
    <MyButton :link="'categories/add'" :title="'Kategoriýalar'">
      Kategoriýa goş
    </MyButton>
    <Table>
      <thead>
        <tr>
          <TBodyTH> Ady </TBodyTH>
          <TBodyTH> Suraty </TBodyTH>
          <TBodyTH> Funksiyalar </TBodyTH>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyTD>{{ item.name }}</TBodyTD>
          <TBodyIMG :img="item" />
          <TBodyFunction>
            <MyLink :link="`categories/${item.id}`" />
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
    await this.fetchDates("get-product-categories");
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
    async removeItem(item) {
      this.arr = this.arr.filter((i) => i.id !== item.id);
      let formDates = new FormData();
      formDates.append("id", item.id);
      this.deleteOrCreateOrUpdateOneData({
        url: "delete-product-categories",
        data: formDates,
      });
    },
  },
};
</script>
