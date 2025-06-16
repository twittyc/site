import { useState } from "react";

export default function Banner() {
  const [visible, setVisible] = useState(true);

  if (!visible) return null;

  return (
    <div className="w-full bg-blue-600 text-white px-4 py-2 text-sm text-center flex items-center justify-center relative z-50">
      <span>
        🚀 Check out the source code for this site on{" "}
        <a
          href="https://github.com/twittyc/site"
          target="_blank"
          rel="noopener noreferrer"
          className="underline hover:text-blue-200"
        >
          GitHub
        </a>
        !
      </span>
      <button
        onClick={() => setVisible(false)}
        className="absolute right-4 top-1/2 -translate-y-1/2 text-white hover:text-blue-300"
        aria-label="Dismiss banner"
      >
        ✕
      </button>
    </div>
  );
}
