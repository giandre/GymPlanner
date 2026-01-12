# Frontend Implementation Notes

## YouTube Video Preview Issue

### Problem
Some YouTube videos show preview thumbnails, others don't. This is because:
- YouTube's thumbnail loading can fail for various reasons (age restrictions, embedding disabled, etc.)
- The video still plays when clicked, but lacks visual preview

### Solution

When rendering exercise videos in the frontend, use this approach:

```javascript
// Extract YouTube video ID from URL
function getYouTubeVideoId(url) {
  const regex = /(?:youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/embed\/)([^&\?\/]+)/;
  const match = url.match(regex);
  return match ? match[1] : null;
}

// Component for exercise video with fallback
function ExerciseVideo({ exercise }) {
  const videoId = getYouTubeVideoId(exercise.video_url);
  const [thumbnailError, setThumbnailError] = useState(false);

  // Try YouTube thumbnail first, fall back to exercise image
  const thumbnailUrl = !thumbnailError && videoId
    ? `https://img.youtube.com/vi/${videoId}/maxresdefault.jpg`
    : exercise.image_url;

  return (
    <div className="video-container">
      <img
        src={thumbnailUrl}
        alt={exercise.name}
        onError={() => setThumbnailError(true)}
        className="video-thumbnail"
      />
      <button onClick={() => openVideo(exercise.video_url)}>
        <PlayIcon />
      </button>
    </div>
  );
}
```

### Alternative: Direct Embed with Thumbnail Parameter

```javascript
// For iframe embeds, you can specify thumbnail explicitly
<iframe
  src={`https://www.youtube.com/embed/${videoId}?rel=0&modestbranding=1`}
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
  allowFullScreen
/>
```

### YouTube Thumbnail URL Formats

Try these in order:
1. `https://img.youtube.com/vi/{VIDEO_ID}/maxresdefault.jpg` (1920x1080)
2. `https://img.youtube.com/vi/{VIDEO_ID}/hqdefault.jpg` (480x360)
3. `https://img.youtube.com/vi/{VIDEO_ID}/mqdefault.jpg` (320x180)
4. Fall back to `exercise.image_url` if all fail

## Exercise Images

All exercises have `image_url` field pointing to `/images/exercises/{exercise_name}.png`

These images are served via Cloudflare Pages CDN and always available as fallback.

## Best Practices

1. **Always show something visual** - Never show a blank box
2. **Lazy load thumbnails** - Only load when scrolling into view
3. **Handle errors gracefully** - Fall back to exercise image
4. **Cache thumbnail availability** - Remember which videos have working thumbnails

## Example Full Implementation

```javascript
const ExerciseCard = ({ exercise }) => {
  const [imageSource, setImageSource] = useState('youtube');
  const videoId = getYouTubeVideoId(exercise.video_url);

  const getImageUrl = () => {
    if (imageSource === 'youtube' && videoId) {
      return `https://img.youtube.com/vi/${videoId}/maxresdefault.jpg`;
    }
    return exercise.image_url;
  };

  return (
    <div className="exercise-card">
      <div className="exercise-media">
        <img
          src={getImageUrl()}
          alt={exercise.name}
          onError={() => setImageSource('local')}
        />
        {exercise.video_url && (
          <button
            onClick={() => window.open(exercise.video_url, '_blank')}
            className="play-button"
          >
            ▶ Watch Video
          </button>
        )}
      </div>
      <h3>{exercise.name}</h3>
      <p>{exercise.description}</p>
      {/* Rest of card content */}
    </div>
  );
};
```

This ensures:
- ✅ All exercises show a visual preview
- ✅ YouTube thumbnails load when available
- ✅ Graceful fallback to exercise images
- ✅ Videos still play when clicked
