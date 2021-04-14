import {useEffect} from 'react'
import {useDispatch} from 'react-redux'

function Api() {
  const dispatch = useDispatch()

  useEffect(() => {
    window.addEventListener("message", message => {
      dispatch(message.data)
    })
  }, [dispatch])

  return (
    <div></div>
  );
}

export default Api;
