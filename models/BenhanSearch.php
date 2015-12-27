<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Benhan;

/**
 * BenhanSearch represents the model behind the search form about `app\models\Benhan`.
 */
class BenhanSearch extends Benhan
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'maHS', 'created_at', 'updated_at'], 'integer'],
            [['deXuatKham', 'ketLuanBA', 'lichHen'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Benhan::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'maHS' => $this->maHS,
            'lichHen' => $this->lichHen,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'deXuatKham', $this->deXuatKham])
            ->andFilterWhere(['like', 'ketLuanBA', $this->ketLuanBA]);

        return $dataProvider;
    }
}
