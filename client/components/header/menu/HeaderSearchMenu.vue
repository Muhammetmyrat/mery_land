<template>
  <div class="menu__search search" :class="{ active: show }">
    <div class="search__wrapper">
      <form class="search__form" @submit.prevent>
        <input
          type="text"
          ref="searchInput"
          placeholder="search"
          @click.stop
          :value="search"
          @input="newVal"
        />
        <p id="demo"></p>
      </form>
    </div>
    <section class="search__result mini-items" v-if="hidden" @click.stop>
      <article
        class="mini-items__item"
        v-for="searchData in searchDatas"
        :key="searchData.id"
      >
        <div class="mini-items__item-wrapper __container">
          <NuxtLink
            :to="localePath(`/search?q=${searchData.id}`)"
            class="mini-items__img"
          >
            <img
              :src="`${imgURL}${searchData.image_path}`"
              alt=""
              @click="$emit('setHidden')"
            />
          </NuxtLink>
          <div class="mini-items__content">
            <NuxtLink
              :to="localePath(`/search?q=${searchData.id}`)"
              class="mini-items__title items-title"
            >
              <h4 @click="$emit('setHidden')">{{ searchData.title }}</h4>
            </NuxtLink>
            <div class="mini-items__category-reading dividet-dot">
              <span>
                <p class="items-text">{{ searchData.text }}...</p>
              </span>
            </div>
          </div>
        </div>
      </article>
    </section>
  </div>
</template>

<script>
export default {
  props: {
    search: {
      type: String,
      default: "",
    },
    show: {
      type: Boolean,
      default: false,
    },
    hidden: {
      type: Boolean,
      default: false,
    },
    searchDatas: {
      type: Array,
      default: () => [],
    },
    imgURL: {
      type: String,
      default: () => "",
    },
  },
  methods: {
    newVal(event) {
      this.$emit("fetchSearchDatasForChild", event.target.value);
    },
  },
};
</script>

<style scoped>
a,
a:focus,
a:hover {
  text-decoration: none;
  color: #c00f1a !important;
  outline: 0;
}

a:focus,
a:hover {
  color: #c00f1a !important;
}
.mini-items__item {
  padding: 10px 0;
  position: relative;
}

.mini-imtes__item.have-new .mini-items__title {
  padding-left: 20px;
  position: relative;
}

.mini-items__item.have-new .mini-items__title::before {
  content: "";
  position: absolute;
  width: 14px;
  height: 14px;
  border-radius: 50%;
  left: 0;
  top: 3px;
  background: #df2f2f;
}

.mini-items__item-wrapper {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
}

.mini-items__img {
  width: 280px;
  height: 110px;
  border-radius: 2px;
  overflow: hidden;
}

.mini-items__img img {
  width: 100%;
  height: 100%;
  -o-object-fit: cover;
  object-fit: cover;
  -o-object-position: center;
  object-position: center;
  background: #e0e0e0;
}

.mini-items__content {
  padding-left: 15px;
}

.mini-items__title {
  font-size: 16px;
  line-height: 21px;
}

.mini-items__category-author {
  margin-top: 6px;
}

.mini-items__count {
  font-family: Segoe UI;
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 19px;
  color: #787878;
  padding-top: 20px;
  padding-bottom: 20px;
}
.mini-items__editor-controllers {
  position: absolute;
  top: 0;
  left: 100%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  padding-left: 30px;
  -webkit-transition: 0s;
  transition: 0s;
}

.mini-items__editor-controllers button {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  margin-bottom: 10px;
  font-family: Segoe UI;
  font-style: normal;
  font-weight: 600;
  font-size: 14px;
  line-height: 19px;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  padding: 5px 10px;
}

.mini-items__editor-controllers button span {
  padding-right: 10px;
  font-size: 18px;
}
.items-text {
  line-height: 1.3 !important;
}
.search {
  color: #ffff;
  z-index: 1;
  -webkit-transition: 0.3s;
  transition: 0.3s;
  width: 89%;
  margin: 0px auto;
  padding-left: 94px;
}
.search.active .search__wrapper {
  width: 100%;
}

.search.active .search__form {
  width: 100%;
  opacity: 1;
}

.search.active .search__result {
  display: block;
}

.search__wrapper {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  justify-content: center;
  -webkit-transition: 0.3s;
  transition: 0.3s;
}

.search__form {
  height: 100%;
  width: 0;
  -webkit-transition: 0.3s;
  transition: 0.3s;
  position: relative;
  overflow: hidden;
  right: -120px;
  opacity: 0;
}

.search__form input {
  width: 87%;
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 19px;
  letter-spacing: 0.04em;
  color: #333333;
  text-transform: uppercase;
  background-color: #ffffff;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 35px;
  border: 1px solid #e0e0e0;
}
.search__form input:focus {
  border: 1px solid #e0e0e0 !important;
}

.search__form input::-webkit-input-placeholder {
  color: #787878;
}

.search__form input:-ms-input-placeholder {
  color: #787878;
}

.search__form input::-ms-input-placeholder {
  color: #787878;
}

.search__form input::placeholder {
  color: #787878;
}

.search__result {
  max-height: 393px;
  display: none;
  overflow: auto;
  overflow-x: hidden;
  -webkit-transform: translateX(62px);
  transform: translateX(62px);
  z-index: 1;
  background-color: #fff;
  width: 777px;
  margin: 0 auto;
  margin-top: 10px;
  z-index: 1;
}

.search__result.mini-items .mini-items__item {
  padding: 10px;
  border-bottom: 1px solid #e0e0e0;
}
@media (max-width: 1200px) {
  .search {
    padding-right: 50px;
    padding-left: 0;
    width: 100%;
  }
  .search__result[data-v-8b0c4bc6] {
    transform: translateX(63px);
    width: 765px;
  }
}
@media (max-width: 991px) {
  .search.active {
    position: absolute;
    top: 90px;
    left: 0;
    height: 301px;
    background: #fff;
    overflow-x: hidden;
    overflow-y: auto;
  }
  .search__wrapper {
    position: sticky;
    top: 0px;
    z-index: 100;
    background: #fff;
  }
  .search__form {
    margin-right: 120px;
  }
  .search__form input {
    border: 1px solid #e0e0e0;
    border-radius: 5px;
  }
  .search__form input:focus {
    border: 1px solid #e0e0e0 !important;
    border-radius: 5px !important;
  }
  .search__result {
    width: 100%;
  }
  .mini-items__item {
    width: 604px;
  }
  .mini-items__title h4 {
    font-size: 20px;
  }
  .mini-items__img {
    width: 200px;
    height: 75px;
  }
  .items-text {
    line-height: 1;
    font-size: 16px !important;
  }
}
@media (max-width: 767px) {
  .search__form {
    margin-right: 45px;
    margin-left: -45px;
  }
  .search__result {
    width: 490px;
  }
  .mini-items__item {
    width: 450px;
  }
  .mini-items__img {
    width: 245px;
    height: 75px;
  }
  .mini-items__title h4 {
    font-size: 18px;
  }
  .items-text {
    line-height: 1;
    font-size: 14px !important;
  }
  @media (max-width: 575px) {
    .search__result {
      margin-left: -50px;
      width: 100%;
    }
    .mini-items__item {
      width: 540px;
    }
    .search__wrapper {
      margin-left: -50px;
      width: 575px !important;
    }
  }
  @media (max-width: 561px) {
    .items-text {
      overflow: hidden;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
      padding-right: 30px;
    }
    .search__result {
      width: 500px !important;
    }
    .mini-items__item {
      width: 550px;
    }
    .search__wrapper {
      width: 575px !important;
    }
  }
  @media (max-width: 530px) {
    .items-text {
      overflow: hidden;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
      padding-right: 30px;
    }
    .search__result {
      margin-left: -50px;
      width: 450px !important;
    }
    .mini-items__item {
      width: 500px;
    }
    .search__wrapper {
      margin-left: -50px;
      width: 535px !important;
    }
  }
  @media (max-width: 500px) {
    .items-text {
      overflow: hidden;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
      padding-right: 81px;
    }
    .search__result {
      width: 400px !important;
      margin-left: -50px;
    }
    .search__wrapper {
      margin-left: -50px;
      width: 470px !important;
    }
  }
  @media (max-width: 440px) {
    .items-text {
      overflow: hidden;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
      padding-right: 132px;
    }
    .search__result {
      width: 350px !important;
    }
    .search__wrapper {
      margin-left: -50px;
      width: 400px !important;
    }
  }
  @media (max-width: 375px) {
    .items-text {
      overflow: hidden;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
      padding-right: 168px;
    }
    .search__result {
      width: 330px !important;
    }
    .search__wrapper {
      margin-left: -50px;
      width: 360px !important;
    }
  }
  @media (max-width: 350px) {
    .items-text {
      overflow: hidden;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
      padding-right: 213px;
    }
    .search__result {
      width: 290px !important;
    }
    .search__wrapper {
      margin-left: -50px;
      width: 320px !important;
    }
  }
}
</style>