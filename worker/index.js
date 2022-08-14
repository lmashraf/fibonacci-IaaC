// Secrets
const keys = require("./keys");

// Create a Redis client
const redis = require("redis");

const redisClient = redis.createClient({
    host: keys.redisHost,
    port: keys.redisPort,
    // Automatically reconnect every 1 second (in ms)
    retry_strategy: () => 1000,
});
// Duplicate Redis client
const sub = redisClient.duplicate();

// Fibonacci:
// Purposely recursive, because it is slow and justifies
// the use of a separate worker process and Redis.
function fib(index) {
    if (index < 2) return 1;
    return fib(index - 1) + fib(index - 2);
}

// For each N value on Redis, calculate fib(N)
// and store it on a hash.
sub.on("message", (channel, message) => {
    redisClient.hset("values", message, fib(parseInt(message)));
});
sub.subscribe("insert");
