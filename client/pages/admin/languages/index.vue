<template>
  <Container>
    <MyButton :link="'languages/add'" :title="' Dil goş'">Diller</MyButton>
    <Table>
      <thead>
        <tr>
          <TBodyTH> Dili</TBodyTH>
          <TBodyTH> Title - 1</TBodyTH>
          <TBodyTH> Title - 2</TBodyTH>
          <TBodyTH> Funksiyalar</TBodyTH>
        </tr>
      </thead>

      <tbody>
        <tr v-for="(item, index) in arr" :key="index">
          <TBodyTD>{{ item.name }}</TBodyTD>
          <TBodyTD>{{ item.short_name }}</TBodyTD>
          <TBodyIMG :img="item" />
          <TBodyFunction>
            <MyLink :link="`languages/${item.id}`" />
            <TBodyButton :item="item" @remove="$emit('remove', item)" />
          </TBodyFunction>
        </tr>
      </tbody>
    </Table>
  </Container>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
//:TBody="sliders"  @remove="removeHomeSlider"
export default {
  layout: "admin",
  data() {
    return {
      arr: "",
    };
  },
  async mounted() {
    await this.fetchAuthToken();
    await this.fetchDates("get-languages");
    await this.takeArr;
    //  await this.sortArray();
  },

  // async updated() {
  //   await this.sortArr;
  // },
  computed: {
    ...mapGetters("admin", ["getDates"]),

    async takeArr() {
      this.arr = await this.getDates;

      // console.log("ARR", this.arr);
    },
  },

  methods: {
    ...mapActions("admin", [
      "fetchAuthToken",
      "fetchDates",
      "deleteOrCreateOrUpdateOneData",
    ]),
    sortArray() {
      let some = this.arr;
      some.sort((item1, item2) => {
        return item1.id - item2.id;
      });
      // console.log("opop", some);
    },
    async removeItem(item) {
      this.arr = this.arr.filter((i) => i.id !== item.id);
      let formDates = new FormData();
      formDates.append("id", item.id);

      this.deleteOrCreateOrUpdateOneData({
        url: "delete-languages",
        data: formDates,
      });
    },
  },
};
</script>
