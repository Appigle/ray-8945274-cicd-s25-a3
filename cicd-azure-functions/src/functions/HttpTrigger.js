const { app } = require('@azure/functions');

app.http('HttpTrigger', {
  methods: ['GET', 'POST'],
  authLevel: 'anonymous',
  handler: async (request, context) => {
    context.log(`Http function processed request for url "${request.url}"`);

    return {
      body: 'Hello, World!',
      headers: {
        'Content-Type': 'text/plain',
      },
    };
  },
});
