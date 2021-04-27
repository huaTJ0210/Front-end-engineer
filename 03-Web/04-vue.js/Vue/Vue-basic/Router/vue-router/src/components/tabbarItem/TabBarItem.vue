<!--  -->
<template>
  <div class="tabbarItem" @click="itemClick">
    <div>
      <div v-if="!isActived">
        <slot name="normal"></slot>
      </div>
      <div v-else>
        <slot name="selected"></slot>
      </div>
    </div>
    <div :style="fontColor">
      <slot name="text"></slot>
    </div>
  </div>
</template>

<script>
export default {
  name: 'TabBarItem',
  props: {
    path: String,
    color:{
      default:'blue',
      type:String
    }
  },
  components: {},
  data() {
    return {};
  },
  computed: {
    isActived() {
      return this.$route.path === this.path;
    },
    fontColor(){
      return this.isActived ? {color:this.color} :{}
    }
  },
  watch: {},
  methods: {
    itemClick() {
      this.$router.push(this.path);
    },
  },
  created() {},
  mounted() {},
  updated() {},
  destroyed() {},
  activated() {},
};
</script>
<style scoped>
.tabbarItem {
  flex: 1;
  text-align: center;
  font-size: 14px;
}
.tabbarItem img {
  width: 24px;
  height: 24px;
  vertical-align: middle;
}
</style>
