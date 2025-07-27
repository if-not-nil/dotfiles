return {
  nn = {
    prefix = "nn",
    body = {
      "if err != nil {",
      "\t${1:// handle}",
      "}"
    }
  },
  auth = {
    prefix = "auth",
    body = {
      'auth := c.Get("auth").(middleware.Auth)',
      "user := auth.User"
    }
  },
}
