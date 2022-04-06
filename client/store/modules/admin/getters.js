// console.log(getBlat);
// const isAuthenticated = (state) => {
//   return state.isAuthenticated;
// };

/*---------------*/
const getDates = (state) => {
  return state.Dates;
};

const getAuthToken = (state) => {
  return state.authToken;
};
const getPassToken = (state) => {
  return state.passToken;
};
const getGetteredDates = (state) => {
  return state.getteredDates;
};
const getIMG = (state) => {
  return state.img;
};
const getImgArray = (state) => {
//   console.log("Its fuckin array with images");
  return state.imgArray;
};

const getCategoriesId = (state) => {
//   console.log("do some fucking magic", state.categoriesId);
  return state.categoriesId;
};

export default {
  // isAuthenticated,
  getAuthToken,
  getPassToken,
  getDates,
  getGetteredDates,
  getIMG,
  getImgArray,
  getCategoriesId,
};
