import actions from "./actions";
import mutations from "./mutations";
import getters from "./getters";

const state = () => ({
  Dates: "",
  getteredDates: "",
  img: "",
  imgArray: "",
  isAuthenticated: false,
  //HomePage
  homeSliders: "",
  homeText: "",
  authToken: "",
  passToken: "",
  categoriesId: "",
});

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters,
};
