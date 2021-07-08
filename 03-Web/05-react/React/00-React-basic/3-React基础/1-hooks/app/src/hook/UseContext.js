import React, { useContext } from 'react';

const themes = {
  light: {
    foreground: '#000000',
    background: '#eeeeee',
  },
  dark: {
    foreground: '#ffffff',
    background: '#222222',
  },
};

const ThemeContext = React.createContext(themes.light);

export default function App() {
  return (
    <ThemeContext.Provider value={themes.dark}>
      <ToolBar></ToolBar>
    </ThemeContext.Provider>
  );
}

function ToolBar(props) {
  return (
    <div>
      <ThemedButton></ThemedButton>
    </div>
  );
}

function ThemedButton() {
  const theme = useContext(ThemeContext);
  return (
    <div>
      <button style={{ background: theme.background, color: theme.foreground }}>
        I am style by theme context
      </button>
    </div>
  );
}
