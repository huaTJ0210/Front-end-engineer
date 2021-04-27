<template>
  <div>
    <p>home</p>
    <button @click="pushMinePage">pushMinePage</button>
  </div>
</template>

<script>
export default {
  methods: {
    pushMinePage() {
      this.$router.push('mine')
    },
  },
}
</script>

<style></style>
