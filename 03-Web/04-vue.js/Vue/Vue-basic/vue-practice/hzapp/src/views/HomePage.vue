<!--  -->
<template>
  <div class="">
    <p>Home Page</p>
    <button @click="getuserInfo">获取用户的信息</button>
  </div>
</template>

<script>
import { getInfo } from '@/api/user.js';
export default {
  name: '',
  components: {},
  data() {
    return {};
  },
  computed: {},
  watch: {},
  created() {},
  mounted() {},
  updated() {},
  destroyed() {},
  activated() {},
  methods: {
    getuserInfo() {
      getInfo().then(
        function(res) {
          console.dir(res);
        },
        function(error) {
          console.log(error);
        }
      );
    },
  },
};
</script>
<style lang="scss" scoped></style>
