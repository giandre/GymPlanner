# Cloudflare R2 Setup for Exercise Images

## Step 1: Create R2 Bucket

1. Go to https://dash.cloudflare.com/
2. Navigate to **R2 Object Storage**
3. Click **Create bucket**
4. Name it: `gym-planner-exercises`
5. Click **Create bucket**

## Step 2: Configure Public Access

1. In your bucket, go to **Settings** tab
2. Under **Public Access**, click **Allow Access**
3. Click **Connect Domain** (optional - for custom domain)
   - Or use the R2.dev subdomain (free)

## Step 3: Upload Images

### Option A: Using Wrangler CLI

```bash
# Upload a single image
wrangler r2 object put gym-planner-exercises/jumping_jacks.png --file=./images/jumping_jacks.png

# Upload all images in a folder
cd images
for file in *.png; do
  wrangler r2 object put gym-planner-exercises/"$file" --file="$file"
done
```

### Option B: Using the Dashboard

1. Go to your bucket → **Objects** tab
2. Click **Upload**
3. Drag and drop all your generated images

## Step 4: Image Naming Convention

Use this naming pattern for consistency:
- **Format**: `{exercise_name_lowercase_underscores}.png`
- **Examples**:
  - `jumping_jacks.png`
  - `bodyweight_squats.png`
  - `dumbbell_chest_press.png`
  - `romanian_deadlifts.png`

## Step 5: Update Database with R2 URLs

After uploading, update the database with R2 URLs:

```sql
-- Get your R2 public URL (will be something like):
-- https://pub-{id}.r2.dev/

UPDATE exercises SET image_url = 'https://pub-YOUR-ID.r2.dev/jumping_jacks.png' WHERE name = 'Jumping Jacks';
UPDATE exercises SET image_url = 'https://pub-YOUR-ID.r2.dev/bodyweight_squats.png' WHERE name = 'Bodyweight Squats';
-- ... etc for all exercises
```

## Step 6: Bind R2 to Worker (Optional - for programmatic access)

Add to `wrangler.jsonc`:

```json
{
  "r2_buckets": [
    {
      "binding": "EXERCISE_IMAGES",
      "bucket_name": "gym-planner-exercises"
    }
  ]
}
```

Then in your Worker, you can serve images directly:

```typescript
// Serve image from R2
if (path.startsWith('/images/')) {
  const imageName = path.replace('/images/', '');
  const object = await env.EXERCISE_IMAGES.get(imageName);

  if (object === null) {
    return new Response('Image not found', { status: 404 });
  }

  return new Response(object.body, {
    headers: {
      'Content-Type': 'image/png',
      'Cache-Control': 'public, max-age=31536000',
    },
  });
}
```

## Cost

**R2 is very affordable:**
- Storage: $0.015/GB/month
- Class A operations (writes): $4.50/million
- Class B operations (reads): $0.36/million
- **Egress: FREE** (this is the big win vs S3)

For your use case with ~50 exercise images:
- Storage: ~50MB = $0.0007/month
- Reads: Even with 10,000 views/month = $0.0036
- **Total: Less than $0.01/month**

## Alternative: Use Public Image CDN

If you want even simpler setup, you can:
1. Upload images to GitHub repo in `/public/images/`
2. Use GitHub raw URLs or Cloudflare Pages' static hosting
3. Reference as: `https://gymplanner.pages.dev/images/jumping_jacks.png`

This is free but slower than R2.
