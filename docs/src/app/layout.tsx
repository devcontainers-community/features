function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <head>
        <meta charSet="UTF-8" />
      </head>
      <body>
        <nav>
          <ul>
            <li>
              <a href="next.svg">next.svg</a>
            </li>
          </ul>
        </nav>
        {children}
      </body>
    </html>
  );
}

export default RootLayout;
