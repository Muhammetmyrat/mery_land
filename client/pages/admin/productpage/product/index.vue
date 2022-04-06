<template>
  <Container>
    <MyButton :link="'product/add'" :title="'Harytlar'"> Haryt goş </MyButton>
    <Table>
      <thead>
        <tr>
          <TBodyTH> Ady </TBodyTH>
          <!-- <TBodyTH> Kategoriýasy </TBodyTH> -->
          <TBodyTH> Maglumaty </TBodyTH>
          <TBodyTH> Suraty </TBodyTH>
          <TBodyTH> Funksiyalar </TBodyTH>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyTD>{{ item.title }}</TBodyTD>
          <TBodyTD>{{ item.text }}</TBodyTD>
          <TBodyIMG :img="item" />
          <TBodyFunction>
            <MyLink :link="`product/${item.id}`" />
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
    //cd   await this.fetchDates("get-products");
    await this.takeArr;
    await this.collectCategoriesId({ categories_id: this.arr });
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
      "collectCategoriesId",
    ]),
    //
    async removeItem(slider) {
      this.arr = this.arr.filter((i) => i.id !== slider.id);
      let formDates = new FormData();
      formDates.append("id", slider.id);
      this.deleteOrCreateOrUpdateOneData({
        url: "delete-products",
        data: formDates,
      });
    },
  },
};
</script>
